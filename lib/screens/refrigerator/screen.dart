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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          brightness: Brightness.light,
          title: Text(widget.refrigerator.name),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 0),
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Tab(text: '전체'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Tab(text: '냉장고'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Tab(text: '냉동실'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Tab(text: '실온'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: !isListOpened
                ? LayoutBuilder(builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 16),
                            color: Color(0xFFFAFBFF),
                            height: constraints.maxHeight / 2,
                            child: TabBarView(
                              children: [
                                _buildFoodListSummary(),
                                _buildFoodListSummary(
                                    storageMethod: StorageMethod.refrigerate),
                                _buildFoodListSummary(
                                    storageMethod: StorageMethod.freeze),
                                _buildFoodListSummary(
                                    storageMethod:
                                        StorageMethod.roomTemperature)
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
                  )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/food/new');
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
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

  bool isListOpened = false;
  var memoList = [];

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