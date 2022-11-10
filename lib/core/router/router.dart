import 'package:flutter/material.dart';
import 'package:tst_flutter_221031/pages/02_%E5%B8%83%E5%B1%80_%E5%AE%B9%E5%99%A8.dart';
import 'package:tst_flutter_221031/pages/03_PageView_%E7%BC%93%E5%AD%98.dart';
import 'package:tst_flutter_221031/pages/index.dart';
import '../../pages/01_iconfont.dart';

class TstRouter {
  static const initialRoute = '/';
  static final Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context) {return const Home();},
    '/iconfont': (BuildContext context) {return const DemoIconFont();},
    '/layCon': (BuildContext context) {return const LayoutContainer();},
    '/pageView': (BuildContext context) {return const PageViewDemo();},
  };

  static GlobalKey<NavigatorState> navigatorState = GlobalKey();

  static NavigatorState get navigator {
    return navigatorState.currentState!;
  }

  static BuildContext get context {
    return navigator.context;
  }


}