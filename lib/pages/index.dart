import 'package:flutter/material.dart';
import 'package:tst_flutter_221031/Component/head.dart';
import 'package:tst_flutter_221031/Component/single_line_fitted_box.dart';
import 'package:tst_flutter_221031/core/router/router.dart';
import 'package:tst_flutter_221031/core/style.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget goPage(String url, String title) {
    return GestureDetector(
      onTap: () { TstRouter.navigator.pushNamed(url);},
      child: SingleLineFittedBox(child: Align(alignment: Alignment.centerLeft, child: Text(title, style: const TextStyle(color: Style.colorBlue3),),)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Head('首页'),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5,
                  ),
                children: [
                  goPage('/iconfont', '01-iconfont'),
                  goPage('/layCon', '02_布局_容器'),
                  goPage('/pageView', '03_PageView_缓存'),
                  goPage('/appInfo', '04_app_info'),
                  goPage('/getXDemo', '05_getx_demo'),

                ],
              ),)
            ],
          ),
        ),);
  }
}
