import 'package:flutter/material.dart';
import 'package:tst_flutter_221031/pages/02_%E5%B8%83%E5%B1%80_%E5%AE%B9%E5%99%A8.dart';
import 'package:tst_flutter_221031/pages/03_PageView_%E7%BC%93%E5%AD%98.dart';
import 'package:tst_flutter_221031/pages/04_%E8%AE%BE%E5%A4%87_app%E7%9B%B8%E5%85%B3%E4%BF%A1%E6%81%AF/04_app_info.dart';
import 'package:tst_flutter_221031/pages/05_getx_demo.dart';
import 'package:tst_flutter_221031/pages/07_%E5%8E%9F%E7%94%9F%E4%BA%A4%E4%BA%92/07-%E5%8E%9F%E7%94%9F%E4%BA%A4%E4%BA%92.dart';
import 'package:tst_flutter_221031/pages/index.dart';
import '../../pages/01_iconfont.dart';

class TstRouter {
  static const initialRoute = '/';
  static final Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context) {return const Home();},
    '/iconfont': (BuildContext context) {return const DemoIconFont();},
    '/layCon': (BuildContext context) {return const LayoutContainer();},
    '/pageView': (BuildContext context) {return const PageViewDemo();},
    '/appInfo': (BuildContext context) {return const AppInfo();},
    '/getXDemo': (BuildContext context) {return const GetXDemo();},
    '/nativeInter': (BuildContext context) {return const NativeInteractive();},
  };

  static GlobalKey<NavigatorState> navigatorState = GlobalKey();

  static NavigatorState get navigator {
    return navigatorState.currentState!;
  }

  static BuildContext get context {
    return navigator.context;
  }


}