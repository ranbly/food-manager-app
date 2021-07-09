import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_manager_app/enum/storage_method.dart';
import 'package:food_manager_app/models/food.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:food_manager_app/services/me.dart';
import 'package:get/get.dart';

class FoodsController extends GetxController {
  final Refrigerator refrigerator;
  final StorageMethod? storageMethod;

  final foodCollectionRef = FirebaseFirestore.instance.collection('foods');
  final foods = <Food>[].obs;

  StreamSubscription? _subscription;

  FoodsController({
    required this.refrigerator,
    this.storageMethod,
  });

  @override
  void onInit() {
    super.onInit();

    // 현재  상태 업데이트
    Query query =
        foodCollectionRef.where('refrigerator', isEqualTo: refrigerator.id);
    if (storageMethod != null) {
      query = query.where('storageMethod', isEqualTo: storageMethod?.tag);
      print('Query Check : storageMethod - ${storageMethod?.tag}');
    }

    _subscription = query
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

  addFood({
    required String name,
    required StorageMethod storageMethod,
    required DateTime expirationAt,
    required int count,
  }) async {
    final food = Food(
      id: '',
      author: MeService.to.me.value!.id,
      refrigerator: refrigerator.id,
      storageMethod: storageMethod,
      count: count,
      expirationAt: expirationAt,
      name: name,
    );
    final data = food.toJson();
    data.remove('id');

    final document = foodCollectionRef.doc();
    await document.set(data);
  }

  /// 섭취
  intake({
    required Food food,
    required int count,
  }) async {
    final batch = FirebaseFirestore.instance.batch();
    batch.update(foodCollectionRef.doc(food.id), {
      'count': FieldValue.increment(-count),
    });
    await batch.commit();
  }
}
