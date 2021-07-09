import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:food_manager_app/services/me.dart';
import 'package:get/get.dart';

class RefrigeratorsController extends GetxController {
  final refrigerators = <Refrigerator>[].obs;

  StreamSubscription? _subscription;

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

  @override
  void onClose() {
    _subscription?.cancel();

    super.onClose();
  }
}
