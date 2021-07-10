import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/controllers/refrigerator.dart';
import 'package:food_manager_app/controllers/refrigerators.dart';
import 'package:food_manager_app/services/me.dart';
import 'package:get/get.dart';

class RefrigeratorManagePage extends StatelessWidget {
  RefrigeratorsController get refrigeratorsController => Get.find();

  RefrigeratorController get controller => Get.find();

  RefrigeratorManagePage({Key? key}) : super(key: key) {
    Get.put(RefrigeratorController(id: Get.parameters['id'] as String));
  }

  bool get isAuthor => controller.author.value == MeService.to.me.value?.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('냉장고 관리')),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 36, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.refrigerator.value.name,
              style: TextStyle(
                color: Color(0xFF1C1C1F),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              decoration: BoxDecoration(
                color: Color(0xFFF8F8FD),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...controller.users.map(
                        (element) => Container(
                          margin: EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              Text(
                                element.name ?? element.id,
                                style: TextStyle(
                                  color: Color(0xff556171),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (element.id ==
                                  controller.refrigerator.value.author)
                                Icon(Icons.admin_panel_settings_outlined),
                              Spacer(),
                              if (isAuthor)
                                Text(
                                  '삭제',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF939FAF),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (isAuthor) SizedBox(height: 4),
                      if (isAuthor)
                        GestureDetector(
                          onTap: () async {
                            try {
                              EasyLoading.show();
                              final link = await controller.createInviteLink();
                            } finally {
                              EasyLoading.dismiss();
                            }
                          },
                          child: Text(
                            '+ 새 구성원 추가하기',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3A83E3),
                            ),
                          ),
                        ),
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Color(0xFFFF5757),
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
                child: Text('이 냉장고 나가기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
