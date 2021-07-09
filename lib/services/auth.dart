import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_manager_app/models/user.dart' as model;
import 'package:food_manager_app/pages/auth/login.dart';
import 'package:food_manager_app/services/me.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxController {
  final _googleSignIn = GoogleSignIn();

  final user = Rx<firebase.User?>(null);

  late StreamSubscription<firebase.User?> userSubscription;

  // Member Variables
  bool initialized = false;

  // Getter
  bool get isLoggedIn => user.value != null;

  static AuthService get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    this.userSubscription =
        FirebaseAuth.instance.userChanges().listen((event) async {
      final oldIsLoggedIn = this.isLoggedIn;
      user.value = event;
      final newIsLoggedIn = this.isLoggedIn;

      // Update Route
      if (!initialized || oldIsLoggedIn != newIsLoggedIn) {
        if (isLoggedIn && event != null) {
          final reference = await FirebaseFirestore.instance
              .collection('users')
              .doc(event.uid)
              .withConverter<model.User>(
                fromFirestore: (snapshot, options) => model.User.fromJson(
                    {'id': snapshot.id, ...snapshot.data() ?? {}}),
                toFirestore: (user, _) => user.toJson(),
              )
              .get();

          // TODO Check
          final batch = FirebaseFirestore.instance.batch();
          final user = reference.data();
          final userDoc =
              FirebaseFirestore.instance.collection('users').doc(event.uid);
          if (user == null) {
            batch.set(
              userDoc,
              {
                'state': 'alive',
                'createdAt': DateTime.now(),
              },
            );
          }

          // Create Refrigerator
          // TODO To Service
          if (user == null || (user.refrigerators?.isEmpty ?? true)) {
            final fridgeDoc =
                FirebaseFirestore.instance.collection('refrigerators').doc();
            batch.set(
              fridgeDoc,
              {
                'author': userDoc.id,
                'name': '나의 냉장고',
                'users': [userDoc.id],
                'createdAt': DateTime.now()
              },
            );

            batch.update(userDoc, {
              'refrigerators': [fridgeDoc.id]
            });
          }

          await batch.commit();

          // TODO State에 따른 상태 처리
          if (user?.state == model.UserState.alive) {
            // Get.offAllNamed('/home');
          } else {
            // Get.offAll(() => SignUpCompletePage());
          }
          Get.offAllNamed('/home');
        } else {
          Get.offAll(() => LoginPage());
        }
      }

      this.initialized = true;
    });
  }

  @override
  void onClose() {
    this.userSubscription.cancel();

    super.onClose();
  }

  signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) throw UnimplementedError('fail_google_login'.tr);

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign In
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithApple() async {}

  signInWithEmail(String email, String password) async {
    await firebase.FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    await signOutWithGoogle();
  }

  signOutWithGoogle() async {
    if (await _googleSignIn.isSignedIn()) await _googleSignIn.signOut();
  }

  emailSignUp(String email, String password) async {
    await firebase.FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  finishSignUp({
    required String nickname,
  }) async {
    // TODO Change To Firebase Functions 닉네임 검증 및 다른 기능들 체크
    final uid = user.value?.uid;
    if (uid == null) throw ArgumentError('unauthenticated'.tr);

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'nickname': nickname,
      'state': 'alive',
    });

    await MeService.to.refresh();
  }
}
