import 'package:flutter/material.dart';
import 'package:tst_flutter_221031/Component/keep-alive.dart';


class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add( KeepAliveWrapper(keepAlive: true, child: Page( text: '$i')));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('PageViewDemo'),),
      body: PageView(
        // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
        allowImplicitScrolling: true,
        children: children,
      ),
    );
  }
}









class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }
}


