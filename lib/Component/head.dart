import 'package:flutter/material.dart';

class Head extends AppBar {
  /// 构造方法
  /// @param title 标题
  /// @param back 显示返回按钮
  Head(String title, {super.key, super.actions})
      : super(
            title: Text(title),
            elevation: 0,
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            bottom: PreferredSize(preferredSize: const Size.fromHeight(8), child: Image.asset('lib/asset/img/separator.png')));
}
