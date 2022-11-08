import 'package:flutter/material.dart';
import 'package:tst_flutter_221031/Component/LayoutLogPrint.dart';
import '../core/style.dart';

class LayoutContainer extends StatelessWidget {
  const LayoutContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("lib/asset/img/tst.png", width: 60.0);

    return Scaffold(
        appBar: AppBar(title: const Text('布局_容器')),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
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
                    DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.red),
                      child: ClipRect(
                          clipper: MyClipper(), //使用自定义的clipper
                          child: avatar),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
