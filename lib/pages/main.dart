import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_manager_app/enum/food_category.dart';
import 'package:food_manager_app/models/food.dart';
import 'package:food_manager_app/models/memo.dart';
import 'package:food_manager_app/wigets/food_item.dart';
import 'package:food_manager_app/wigets/memo_input.dart';
import 'package:food_manager_app/wigets/memo_item.dart';

import 'create_food.dart';

class Main extends StatefulWidget {
  Main({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Main> {
  bool isListOpened = false;
  var memoList = [Memo(1, '1'), Memo(3, '테스트')];

  void _toggleList() {
    setState(() {
      isListOpened = !isListOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          brightness: Brightness.light,
          title: Text(widget.title),
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
                      child: Tab(
                        text: '전체',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Tab(
                        text: '냉장고',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Tab(
                        text: '냉동실',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Tab(
                        text: '실온',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
            child: !isListOpened
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Color(0xFFFAFBFF),
                          height: MediaQuery.of(context).size.height * 0.35,
                          padding: EdgeInsets.only(top: 16),
                          child: TabBarView(children: [
                            _buildFoodListContainer(),
                            _buildFoodListContainer(
                                category: FoodCategory.FRIDGE),
                            _buildFoodListContainer(
                                category: FoodCategory.FREEZER),
                            _buildFoodListContainer(
                                category: FoodCategory.ROOM_TEMPERATURE)
                          ]),
                        ),
                        Container(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 32, horizontal: 36),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('메모',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  ...memoList
                                      .map((memo) => MemoItem(memo: memo)),
                                  MemoInput()
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(top: 16),
                    color: Color(0xFFFAFBFF),
                    child: TabBarView(children: [
                      __buildFoodFullListContainer(),
                      __buildFoodFullListContainer(),
                      __buildFoodFullListContainer(),
                      __buildFoodFullListContainer()
                    ]),
                  )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateFood.routePath);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  //steam builder, future builder
  Widget _buildFoodListContainer({FoodCategory? category}) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('foods')
            .where('category', isEqualTo: category?.value)
            .snapshots(),
        builder: (context, snapshot) {
          final docs = snapshot.data?.docs ?? [];
          return Container(
              child: Column(children: [
            ...docs.sublist(0, min(5, docs.length)).map((doc) => FoodItem(
                  Food(
                      name: doc.get('name'),
                      expirationDate: doc.get('expirationDate'),
                      count: doc.get('count'),
                      category: FoodCategory.FREEZER),
                )),
            Expanded(child: Container()),
            TextButton(
                onPressed: _toggleList,
                child: Text('전체보기',
                    style: TextStyle(
                        color: Color(0xFF99A6B7), fontWeight: FontWeight.bold)))
          ]));
        });
  }

  Widget __buildFoodFullListContainer() {
    return SafeArea(
      child: Column(children: [
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                FoodItem(
                  Food(
                      name: '딸기',
                      expirationDate: 1,
                      count: 1,
                      category: FoodCategory.ROOM_TEMPERATURE),
                )
              ],
            ),
          ),
        )),
        TextButton(
            onPressed: _toggleList,
            child: Text('접기',
                style: TextStyle(
                    color: Color(0xFF99A6B7), fontWeight: FontWeight.bold)))
      ]),
    );
  }
}
