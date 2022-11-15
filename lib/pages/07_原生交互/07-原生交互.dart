import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_scankit/scan_kit_widget.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:tst_flutter_221031/component/head.dart';
import 'package:tst_flutter_221031/core/style.dart';
import 'package:tst_flutter_221031/utils/scan_code.dart';

class NativeInteractive extends StatefulWidget {
  const NativeInteractive({Key? key}) : super(key: key);

  @override
  State<NativeInteractive> createState() => _NativeInteractiveState();
}

class _NativeInteractiveState extends State<NativeInteractive> with TickerProviderStateMixin {
  List<String> _tabs = [
    '二维码','tst'
  ];
  List<Widget> _tabViewList = [];
  late TabController _controller;
  int _selectedIndex = 0;
  String? _scanRes;

  @override
  void initState() {
    super.initState();
    _tabViewList = [getQrView(), tst()];
    TabController _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head('原生交互'),
      body: Row(
        children: [
          Container(
            color: Colors.white,
            width: 100,
            child: ListView(
              children: _tabs
                  .asMap()
                  .entries
                  .map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = e.key;
                        });
                      },
                      child: Container(
                        padding: Style.paddingMain,
                        alignment: Alignment.center,
                        child: Text(
                          e.value,
                          style: TextStyle(color: _selectedIndex == e.key ? Style.colorBlue4 : Colors.black),
                        ),
                      )))
                  .toList(),
            ),
          ),
          Style.marginHorizontalSub,
          Expanded(child: Container(color: Colors.white, alignment: Alignment.topCenter, child: _tabViewList[_selectedIndex]))
        ],
      ),
    );
  }

  Widget getQrView() {
    return Builder(builder: (_) {
      return Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Style.marginVerticalLarge,
              GestureDetector(
                  onTap: () async {
                    var res = await scanCode();
                    setState(() {
                      (_ as Element).markNeedsBuild();
                      _scanRes = res;
                    });
                    print('==================res==========$res');
                  },
                  child: Text('点击123')),
              Style.marginVerticalMain,
              Text(_scanRes ?? ''),
              GestureDetector( onTap: () async {
                var res = await Navigator.push(context, MaterialPageRoute(builder: (_){
                  return CustomizedView();
                }));
                print('===============跳转$res');
              },child:
              Text('点击'),)
            ],
          ));
    });
  }

  Widget tst() {

    return Container(child: Text('tst'),);
  }
}
//
// Future<String> scanCode({List<ScanTypes>? types}) async {
//   var completer = Completer<String>();
//
//   if (await Permission.camera.request() == PermissionStatus.granted) {
//     var scanKit = FlutterScankit();
//     scanKit.addResultListen((res) {
//       completer.complete(res);
//     });
//
//     await scanKit.startScan(scanTypes: types ?? [ScanTypes.ALL]);
//   }
//
//   return await completer.future;
// }
//
class CustomizedView extends StatefulWidget {
  const CustomizedView({Key? key}) : super(key: key);

  @override
  State<CustomizedView> createState() => _CustomizedViewState();
}


class _CustomizedViewState extends State<CustomizedView> {
  late ScanKitController _controller;

  final screenWidth = window.physicalSize.width;
  final screenHeight = window.physicalSize.height;

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var boxSize = screenWidth/(2*window.devicePixelRatio);
    var pixelSize = boxSize * window.devicePixelRatio;
    var left = screenWidth/2 - pixelSize/2;
    var top = screenHeight/2 - pixelSize/2;
    var right = screenWidth/2 + pixelSize/2;
    var bottom = screenHeight/2 + pixelSize/2;
    var rect = Rect.fromLTRB(left, top, right, bottom);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ScanKitWidget(
                callback: (controller) {
                  _controller = controller;

                  controller.onResult.listen((result) {
                    debugPrint("scanning result:$result");

                    Navigator.of(context).pop(result);
                  });
                },
                continuouslyScan: false,
                boundingBox: rect),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        _controller.switchLight();
                      },
                      icon: Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        _controller.pickPhoto();
                      },
                      icon: Icon(
                        Icons.picture_in_picture_rounded,
                        color: Colors.white,
                        size: 28,
                      ))
                ],
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Colors.orangeAccent, width: 2),
                      right: BorderSide(color: Colors.orangeAccent, width: 2),
                      top: BorderSide(color: Colors.orangeAccent, width: 2),
                      bottom: BorderSide(color: Colors.orangeAccent, width: 2)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
