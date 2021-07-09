import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_manager_app/models/user.dart' as model;
import 'package:food_manager_app/services/auth.dart';
import 'package:get/get.dart';

class MeService extends GetxService {
  static MeService get to => Get.find();

  Rx<model.User?> me = Rx(null);

  late StreamSubscription _userSubscription;

  @override
  void onInit() {
    super.onInit();

    _userSubscription = AuthService.to.user.listen((user) {
      if (user == null) {
        me.value = null;
      } else {
        _onUpdateMe(user);
      }
    });
  }

  @override
  void onClose() {
    _userSubscription.cancel();

    super.onClose();
  }

  Future<void> refresh() async {
    final firebaseUser = AuthService.to.user.value;

    if (firebaseUser == null) return;
    await _onUpdateMe(firebaseUser);
  }

  Future<void> _onUpdateMe(User user) async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .withConverter<model.User>(
          fromFirestore: (snapshot, options) => model.User.fromJson(
              {'id': snapshot.id, ...snapshot.data() ?? {}}),
          toFirestore: (user, _) => user.toJson(),
        )
        .get();
    this.me.value = document.data();
  }

  // Future<void> updateMe({
  //   StorageFile? avatar,
  //   String? nickname,
  //   String? introduce,
  //   String? socialUrl,
  // }) async {
  //   final userDocRef =
  //       FirebaseFirestore.instance.collection('users').doc(me.value!.id);
  //   final batch = FirebaseFirestore.instance.batch();
  //
  //   if (avatar != null) {
  //     batch.update(userDocRef, {'avatar': avatar.toJson()});
  //   }
  //
  //   if (nickname != null) {
  //     batch.update(userDocRef, {'nickname': nickname});
  //   }
  //
  //   if (introduce != null) {
  //     batch.update(userDocRef, {'introduce': introduce});
  //   }
  //
  //   if (socialUrl != null) {
  //     batch.update(userDocRef, {'socialUrl': socialUrl});
  //   }
  //
  //   await batch.commit();
  // }

  updateAvatar() async {
    // final _imagePicker = ImagePicker();
    // final response = await _imagePicker.getImage(source: ImageSource.gallery);
    // final firebaseUserUID = AuthService.to.user.value?.uid;
    // if (firebaseUserUID == null) return;
    //
    // // 사진 업로드 정보
    // final storageFile = await StorageService.to.uploadPhoto(
    //   File(response!.path),
    //   reference: FirebaseStorage.instance
    //       .ref('users')
    //       .child(firebaseUserUID)
    //       .child('avatars'),
    // );
    //
    // await updateMe(avatar: storageFile);
  }
}
