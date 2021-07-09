import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_manager_app/models/food.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:get/get.dart';

class FoodsController extends GetxController {
  final Refrigerator refrigerator;

  final foodCollectionRef = FirebaseFirestore.instance.collection('foods');
  final foods = <Food>[].obs;

  StreamSubscription? _subscription;

  FoodsController({required this.refrigerator});

  @override
  void onInit() {
    super.onInit();

    // 현재  상태 업데이트
    _subscription = foodCollectionRef
        .where('refrigerator', isEqualTo: refrigerator.id)
        .withConverter<Food>(
            fromFirestore: (doc, _) =>
                Food.fromJson({'id': doc.id, ...doc.data() ?? {}}),
            toFirestore: (data, _) => data.toJson())
        .snapshots()
        .listen((event) {
      foods
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
