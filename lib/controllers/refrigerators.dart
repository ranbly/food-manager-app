import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:food_manager_app/services/me.dart';
import 'package:get/get.dart';

class RefrigeratorsController extends GetxController {
  final refrigerators = <Refrigerator>[].obs;

  StreamSubscription? _subscription;

  final refrigeratorCollectionRef =
      FirebaseFirestore.instance.collection('refrigerators');

  static RefrigeratorsController get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    final meId = MeService.to.me.value?.id;
    if (meId == null) throw AssertionError('Unauthenticated');

    _subscription = FirebaseFirestore.instance
        .collection('refrigerators')
        .where('users', arrayContains: meId)
        .withConverter<Refrigerator>(
            fromFirestore: (snapshot, _) => Refrigerator.fromJson(
                {'id': snapshot.id, ...snapshot.data() ?? {}}),
            toFirestore: (data, _) => data.toJson())
        .snapshots()
        .listen((event) {
      refrigerators
        ..clear()
        ..addAll(event.docs.map((e) => e.data()));
    });
  }

  Refrigerator getRefrigerator(String id) {
    return refrigerators.firstWhere((element) => element.id == id);
  }

  @override
  void onClose() {
    _subscription?.cancel();

    super.onClose();
  }

  Future<Refrigerator> addRefrigerator({required String name}) async {
    final doc = refrigeratorCollectionRef.doc();

    final refrigerator = Refrigerator(
      id: doc.id,
      author: MeService.to.me.value!.id,
      users: [MeService.to.me.value!.id],
      name: name,
    );

    await doc.set(refrigerator.toJson()..remove('id'));

    return refrigerator;
  }
}
