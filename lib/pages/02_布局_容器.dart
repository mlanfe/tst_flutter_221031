
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:tst_flutter_221031/component/layout_log_print.dart';
import 'package:tst_flutter_221031/component/single_line_fitted_box.dart';
import 'package:tst_flutter_221031/component/infinite_list.dart';
import 'package:tst_flutter_221031/component/infinite_list_2.dart';

import 'package:tst_flutter_221031/core/style.dart';

Widget avatar = Image.asset("lib/asset/img/tst.png", width: 60.0);

class LayoutContainer extends StatefulWidget {
  const LayoutContainer({Key? key}) : super(key: key);

  @override
  State<LayoutContainer> createState() => _LayoutContainerState();
}

class _LayoutContainerState extends State<LayoutContainer> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _infiniteList = [];
  final List<String> _infiniteList2 = [];

  @override
  void initState() {
    super.initState();_retrieveData();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back)),
          title: const Text('布局_容器'),
          bottom: TabBar(
            labelColor: Colors.white,
            controller: _tabController,
            tabs: const [
              FittedBox(child: Text('布局 demo')),
              FittedBox(child: Text('无限滚动1')),
              FittedBox(child: Text('无限滚动2')),
              FittedBox(child: Text('滚动 demo')),
            ],
          ),
        ),

        drawer: MediaQuery.removeViewPadding(
          context: context,
          child: Container(color: Colors.white, width: 100,child: Column(
            children: const [Text('1233', style: TextStyle(color: Colors.blue),)],
          ),),
        ),

        endDrawer: const MyDrawer(),
        resizeToAvoidBottomInset: false,
        // restorationId: ,
        // persistentFooterButtons: const [
        //   Text('11'),
        //   Text('22'),
        //   Text('33'),
        // ],
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // PrimaryScrollController.of(context)?.
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {_tabController.index = 0;}, icon: const Icon(Icons.home)),
              const SizedBox(), //中间位置空出
              IconButton(onPressed: () {
                _tabController.index = 1;

              }, icon: const Icon(Icons.business)),
            ], //均分底部导航栏横向空间
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: ListView(
                children: [
                  Align(
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(top: 20),
                      color: Colors.yellow,
                      child: Align(
                        alignment: const Alignment(-0.5, -0.5),
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(top: 20),
                      color: Colors.blue,
                      child: Align(
                        alignment: const FractionalOffset(0.25, 0.25),
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(top: 30),
                      color: Colors.blue,
                      child: Align(
                        alignment: const Alignment(0, 0),
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const LayoutLogPrint(
                    child: Text('tst'),
                  ),
                  Center(
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.red, Colors.orange.shade700]), //背景渐变
                            borderRadius: BorderRadius.circular(3.0), //3像素圆角
                            boxShadow: const [
                              //阴影
                              BoxShadow(color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
                            ]),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.red, Colors.orange.shade700]), //背景渐变
                          borderRadius: BorderRadius.circular(3.0), //3像素圆角
                          boxShadow: const [
                            //阴影
                            BoxShadow(color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
                          ]),
                      child: const Text(
                        'tst',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 60),
                      color: Colors.black,
                      child: Transform(
                        alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                        transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.deepOrange,
                          child: const Text('Apartment for rent!'),
                        ),
                      ),
                    ),
                  ),
                  Style.marginVerticalMain,
                  Center(
                    child: Column(
                      children: <Widget>[
                        avatar, //不剪裁
                        Style.marginVerticalMain,
                        ClipOval(child: avatar), //剪裁为圆形
                        Style.marginVerticalMain,
                        ClipRRect(
                          //剪裁为圆角矩形
                          borderRadius: BorderRadius.circular(5.0),
                          child: avatar,
                        ),
                        Style.marginVerticalMain,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                              child: avatar,
                            ),
                            const Text(
                              "你好世界1",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                        Style.marginVerticalMain,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipRect(
                              //将溢出部分剪裁
                              child: Align(
                                alignment: Alignment.topLeft,
                                widthFactor: .5, //宽度设为原来宽度一半
                                child: avatar,
                              ),
                            ),
                            const Text("你好世界2", style: TextStyle(color: Colors.green))
                          ],
                        ),
                        Style.marginVerticalMain,
                      ],
                    ),
                  ),
                  Style.marginVerticalMain,
                  Center(
                    child: Column(
                      children: [
                        wContainer(BoxFit.none),
                        const Text('Wendux'),
                        wContainer(BoxFit.contain),
                        const Text('Flutter中国'),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        wRow(' 90000000000000000 '),
                        FittedBox(child: wRow(' 90000000000000000 ')),
                        SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
                        wRow(' 800 '),
                        FittedBox(child: wRow(' 800 ')),
                        SingleLineFittedBox(child: wRow(' 800')),
                      ]
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: e,
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            InfiniteListView(
            pageStorageKey: const PageStorageKey(1),
              _infiniteList.map((e) => Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                margin: const EdgeInsets.all(10),
                child: Text(e, style: const TextStyle(color: Colors.white),),
              )).toList(),
              onRefresh: () {
                debugPrint('======上拉刷新====================${_infiniteList.length}');
                _infiniteList.clear();
                _retrieveData1();
              },
              onLoad: () {

                debugPrint('======下拉刷新====================${_infiniteList.length}');
                _retrieveData1();
              },
            ),
            InfiniteList(
              refresh: true,
              onLoad: _retrieveData,
              onRefresh: () {
                setState(() {
                  _infiniteList2.clear();
                  _retrieveData();
                });
              },
              [
                SliverPadding(
                    padding: Style.paddingPage,
                    sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) => GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.blue,
                            margin: const EdgeInsets.all(10),
                            child: Text(_infiniteList2[index], style: const TextStyle(color: Colors.white),),
                          ),
                          onTap: () async {

                          },
                        ),childCount: _infiniteList2.length))),
                SliverPadding(
                    padding: Style.paddingPage,
                    sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) => GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.orange,
                            margin: const EdgeInsets.all(10),
                            child: Text(_infiniteList2[index], style: const TextStyle(color: Colors.white),),
                          ),
                          onTap: () async {

                          },
                        ),childCount: _infiniteList2.length))),
              ],
              
              
            ),
            Scrollbar(
              child: CustomScrollView(
                slivers: <Widget>[
                   SliverAppBar(
                     automaticallyImplyLeading: false,
                     actions:[ Container()],
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text('CustomScrollView Demo', style: TextStyle(fontSize: Style.fontSizeLarge),),
                      background: Image.asset(
                        'lib/asset/img/tst.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 4.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return  Container(
                            alignment: Alignment.center,
                            color: Colors.teal[100 * (index % 9)],
                        child:  Text('grid item $index'
                        )
                        ,
                        );
                      },
                      childCount: 10,
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 50.0,
                    delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return  Container(
                            alignment: Alignment.center,
                            color: Colors.lightBlue[100 * (index % 9)],
                            child:  Text('list item $index'),
                          );
                        },
                        childCount: 20
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void _retrieveData1() async {
    debugPrint('_retrieveData=========================');
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      //重新构建列表
      _infiniteList.addAll(
        //每次生成20个单词
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
      );
    });
  }

  void _retrieveData() async {
    debugPrint('_retrieveData=========================');
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      //重新构建列表
      _infiniteList2.addAll(
        //每次生成20个单词
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        // generateWordPairs().take(20).map((e) => SliverPadding(
        //     padding: Style.paddingPage,
        //     sliver: SliverList(
        //         delegate: SliverChildBuilderDelegate((context, index) => GestureDetector(
        //           child: Container(
        //             margin: const EdgeInsets.only(bottom: Style.gapSub),
        //             child: Text(e.asPascalCase)),
        //           ),
        //
        //             childCount: _infiniteList2.length), ))).toList(),
      );
    });
  }
  // 直接使用Row
  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );
  }
}

class HYHomeDrawer extends StatelessWidget {
  const HYHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        child: Drawer(
          child: Column(
            children: <Widget>[
              buildHeaderView(context),
              buildListTile(context, const Icon(Icons.restaurant), "进餐", () {
                Navigator.of(context).pop();
              }),
              buildListTile(context, const Icon(Icons.settings), "过滤", () {}),
            ],
          ),
        ));
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: Colors.orange,
      margin: const EdgeInsets.only(bottom: 20),
      alignment: const Alignment(0, 0.5),
      child: const Text(
        "开始动手",
      ),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        // child: Container(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: avatar,
                    ),
                  ),
                  const Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
