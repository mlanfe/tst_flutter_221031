import 'dart:async';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:permission_handler/permission_handler.dart';

/// 扫码
/// @param types 码类型
/// @return 结果
Future<String> scanCode({List<ScanTypes>? types}) async {

  var completer = Completer<String>();
  if (await Permission.camera.request() == PermissionStatus.granted) {
    var scanKit = FlutterScankit()
                  ..addResultListen((res) {
                    completer.complete(res);
                  });

    await scanKit.startScan(scanTypes: types ?? [ScanTypes.ALL]);
  } else {
    print('没有相机权限');
  }

  return await completer.future;
}
