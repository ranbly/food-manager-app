import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_manager_app/models/memo.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:food_manager_app/services/me.dart';
import 'package:get/get.dart';

class MemosController extends GetxController {
  final Refrigerator refrigerator;

  final memoCollectionRef = FirebaseFirestore.instance.collection('memos');
  final memos = <Memo>[].obs;

  StreamSubscription? _subscription;

  MemosController({required this.refrigerator});

  @override
  void onInit() {
    super.onInit();

    // 현재 냉장고 상태 업데이트
    _subscription = memoCollectionRef
        .where('refrigerator', isEqualTo: refrigerator.id)
        .where('checked', isEqualTo: false)
        .withConverter<Memo>(
            fromFirestore: (doc, _) =>
                Memo.fromJson({'id': doc.id, ...doc.data() ?? {}}),
            toFirestore: (data, _) => data.toJson())
        .snapshots()
        .listen((event) {
      memos
        ..clear()
        ..addAll(event.docs.map((e) => e.data()));
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();

    super.onClose();
  }

  addMemo(String content) async {
    final memo = Memo(
      id: '',
      checked: false,
      content: content,
      author: MeService.to.me.value!.id,
      refrigerator: refrigerator.id,
    );
    final data = memo.toJson();
    data.remove('id');

    final document = FirebaseFirestore.instance.collection('memos').doc();
    await document.set(data);
  }

  checkMemo(String memoId) async {
    await FirebaseFirestore.instance
        .collection('memos')
        .doc(memoId)
        .update({'checked': true});
  }
}
