import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tst_flutter_221031/core/debug.dart';
import 'package:tst_flutter_221031/core/router/router.dart';
import 'package:tst_flutter_221031/core/style.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME framework Show debugPrint

void main() {
  /// 使用getX的路由
  if (kDebugMode) {
    Debug.initiate();
    runApp(const UMEWidget(enable: true, child: GetMaterialApp(home: MyApp())));
  } else {
    runApp(const GetMaterialApp(home: MyApp()));
  }
  /// 不使用getX的路由
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: TstRouter.routes,
      initialRoute: TstRouter.initialRoute,
      navigatorKey: TstRouter.navigatorState,
      theme: Style.theme,

    );
  }
}