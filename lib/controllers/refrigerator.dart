import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_manager_app/controllers/refrigerators.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:food_manager_app/models/user.dart';
import 'package:get/get.dart';

class RefrigeratorController extends GetxController {
  final String id;
  late final Rx<Refrigerator> refrigerator;

  // 구성원
  final RxList<User> users = <User>[].obs;

  // 주인
  late final author = refrigerator.value.author.obs;

  // 유저 Collection Ref
  final _userCollectionRef = FirebaseFirestore.instance.collection('users');

  // 구성원 Subscription
  StreamSubscription? _userSubscription;

  RefrigeratorsController get refrigeratorsController => Get.find();

  RefrigeratorController({required this.id}) {
    this.refrigerator = refrigeratorsController.getRefrigerator(id).obs;
  }

  @override
  void onInit() {
    _userSubscription = _userCollectionRef
        .where(FieldPath.documentId, whereIn: refrigerator.value.users)
        .withConverter<User>(
          fromFirestore: (doc, _) =>
              User.fromJson({'id': doc.id, ...doc.data() ?? {}}),
          toFirestore: (data, _) => data.toJson(),
        )
        .snapshots()
        .listen((event) {
      users
        ..clear()
        ..addAll(event.docs.map((e) => e.data()));
      users.sort((a, b) => a.id == refrigerator.value.author ? 0 : 1);
    });

    super.onInit();
  }

  @override
  void onClose() {
    _userSubscription?.cancel();

    super.onClose();
  }

  createInviteLink() async {
    return '';
  }
}
