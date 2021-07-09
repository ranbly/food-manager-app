import 'package:food_manager_app/models/memo.dart';
import 'package:get/get.dart';

class MemoService extends GetxService {
  final RxList<Memo> memos = RxList.empty(growable: true);

  @override
  void onInit() {
    super.onInit();

    // FirebaseFirestore.instance.collection('memos')
    //     .where('author', isEqualTo:);
    //     .snapshots();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
