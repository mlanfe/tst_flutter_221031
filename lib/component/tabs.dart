import 'package:flutter/material.dart';
import 'package:tst_flutter_221031/component/single_line_fitted_box.dart';
import 'package:tst_flutter_221031/core/style.dart';

class Tabs extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;
  const Tabs({ required this.tabTitles, required this.tabViews, super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin{
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50,
        color: Colors.white,
        child: TabBar(
          controller: _controller,
          tabs: widget.tabTitles.map((e) => SingleLineFittedBox(child: Text(e))).toList(),
          indicator: const BoxDecoration(),
          labelColor: Style.colorBlue4,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700, ),
          unselectedLabelColor: Style.colorGray4,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, ),
        ),
      ),
      Container(height: 5, color: Style.colorGray8,),
      Expanded(
        child: TabBarView(controller: _controller, children: widget.tabViews),
      )
    ],);
  }
}
