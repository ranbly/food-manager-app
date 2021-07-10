import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:food_manager_app/controllers/foods.dart';
import 'package:food_manager_app/controllers/memos.dart';
import 'package:food_manager_app/enum/storage_method.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:food_manager_app/wigets/food_item.dart';
import 'package:food_manager_app/wigets/memo_input.dart';
import 'package:food_manager_app/wigets/memo_item.dart';
import 'package:get/get.dart';

class RefrigeratorScreen extends StatefulWidget {
  final Refrigerator refrigerator;

  RefrigeratorScreen({
    Key? key,
    required this.refrigerator,
  }) : super(key: key) {
    Get.put(MemosController(refrigerator: refrigerator));

    final methods = <StorageMethod?>[null, ...StorageMethod.values];
    methods.forEach((element) {
      Get.put(
        FoodsController(refrigerator: refrigerator, storageMethod: element),
        tag: element?.tag,
        permanent: true,
      );
    });
  }

  @override
  _RefrigeratorScreenState createState() => _RefrigeratorScreenState();
}

class _RefrigeratorScreenState extends State<RefrigeratorScreen> {
  MemosController get memosController => Get.find();

  bool isListOpened = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(child: Container()),
              ListTile(
                dense: true,
                title: Text('설정'),
                onTap: () {
                  Get.toNamed('/setting');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(widget.refrigerator.name),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kTextTabBarHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 12),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  labelColor: Color(0xFF3B4655),
                  indicatorColor: Color(0xFF3B4655),
                  unselectedLabelColor: Color(0xFFB2BDC9),
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: '전체'),
                    Tab(text: '냉장고'),
                    Tab(text: '냉동실'),
                    Tab(text: '실온')
                  ],
                ),
              ),
            ),
          ),
        ),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed('/food/new'),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return !isListOpened
        ? LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    color: Color(0xFFFAFBFF),
                    height: 50 * 5 + 56,
                    child: TabBarView(
                      children: [
                        _buildFoodListSummary(),
                        _buildFoodListSummary(
                            storageMethod: StorageMethod.refrigerate),
                        _buildFoodListSummary(
                            storageMethod: StorageMethod.freeze),
                        _buildFoodListSummary(
                            storageMethod: StorageMethod.roomTemperature)
                      ],
                    ),
                  ),
                  _buildMemos(),
                ],
              ),
            );
          })
        : Container(
            padding: EdgeInsets.only(top: 16),
            color: Color(0xFFFAFBFF),
            child: TabBarView(children: [
              _buildFoodListFull(),
              _buildFoodListFull(
                storageMethod: StorageMethod.refrigerate,
              ),
              _buildFoodListFull(
                storageMethod: StorageMethod.freeze,
              ),
              _buildFoodListFull(
                storageMethod: StorageMethod.roomTemperature,
              )
            ]),
          );
  }

  /// 최대 5개 까지 음식 리스트를 보여주는 리스트
  Widget _buildFoodListSummary({StorageMethod? storageMethod}) {
    final foodsController = Get.find<FoodsController>(tag: storageMethod?.tag);
    return Obx(
      () => Column(
        children: [
          ...foodsController.foods
              .sublist(0, math.min(5, foodsController.foods.length))
              .map((food) => FoodItem(food)),
          Expanded(child: Container()),
          TextButton(
              onPressed: _toggleList,
              child: Text('전체보기',
                  style: TextStyle(
                      color: Color(0xFF99A6B7), fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }

  /// 모든 음식 리스트를 보여주는 리스트
  Widget _buildFoodListFull({StorageMethod? storageMethod}) {
    final foodsController = Get.find<FoodsController>(tag: storageMethod?.tag);
    return Obx(
      () => SafeArea(
        child: Column(children: [
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: foodsController.foods
                    .map((food) => FoodItem(food))
                    .toList(),
              ),
            ),
          )),
          TextButton(
              onPressed: _toggleList,
              child: Text('접기',
                  style: TextStyle(
                      color: Color(0xFF99A6B7), fontWeight: FontWeight.bold)))
        ]),
      ),
    );
  }

  void _toggleList() {
    setState(() {
      isListOpened = !isListOpened;
    });
  }

  /// 메모 리스트
  Widget _buildMemos() {
    return Obx(
      () => Container(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('메모',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ...memosController.memos.map((memo) => MemoItem(memo: memo)),
                MemoInput()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
