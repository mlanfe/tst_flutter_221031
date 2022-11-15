// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:oktoast/oktoast.dart';
// import 'package:vibration/vibration.dart';
// import 'package:zeegma/components/head.dart';
// import 'package:zeegma/core/permission.dart';
// import '../components/modal_bottom.dart';
// import 'atlas.dart';
// import 'style.dart';
// import '../utils/item.dart';
// import '../global.dart';
// import 'package:torch_light/torch_light.dart';
//
// const Map<MessageType, Color> _messageTypeMap = {
//   MessageType.info: Style.colorGray3,
//   MessageType.success: Style.colorGreen4,
//   MessageType.error: Style.colorRed2,
//   MessageType.warn: Style.colorYellow1
// };
//
// /// 消息类型
// enum MessageType { info, success, error, warn }
//
// /// 界面交互
// class Ui {
//   static Notification notification = Notification();
//
//   /// Toast
//   /// @param content 内容
//   /// @param type 类型
//   /// @param single 单例
//   /// @return ToastFuture
//   static ToastFuture toast(String content, {MessageType type = MessageType.info, bool single = false}) {
//     return showToast(content, position: ToastPosition.bottom, backgroundColor: _messageTypeMap[type], dismissOtherToast: single);
//   }
//
//   /// Snack
//   /// @param content 内容
//   /// @param type 类型
//   /// @return ScaffoldFeatureController
//   static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snack(String content, {MessageType type = MessageType.info}) {
//     return ScaffoldMessenger.of(Atlas.context).showSnackBar(SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: _messageTypeMap[type]));
//   }
//
//   /// 对话框
//   /// @param child 子组件
//   /// @param direction 方向
//   /// @return 结果
//   static Future<T?> dialog<T>(Widget child, {AxisDirection? direction}) {
//     if (direction == AxisDirection.up) {
//       return showGeneralDialog<T>(
//           context: Atlas.context,
//           barrierDismissible: true,
//           barrierLabel: "",
//           pageBuilder: (context, animation, secondaryAnimation) => child,
//           transitionBuilder: (context, animation, secondaryAnimation, child) =>
//               Transform.translate(offset: Offset(0, MediaQuery.of(context).size.height * (1 - animation.value)), child: child));
//     } else {
//       return showDialog<T>(context: Atlas.context, builder: (context) => child);
//     }
//   }
//
//   /// 对话框-菜单
//   /// @param items 选项
//   /// @return 结果
//   static Future<T?> dialogMenu<T>(List<Item<T>> items) async {
//     var children = <Widget>[];
//     for (var a in items) {
//       children.add(GestureDetector(onTap: () => Atlas.navigator.pop(a.value), behavior: HitTestBehavior.opaque, child: Container(padding: Style.paddingMain, child: Text(a.name))));
//       if (items.indexOf(a) != items.length - 1) {
//         children.add(Style.borderMain);
//       }
//     }
//     children.add(Container(height: 4, color: Style.colorBorder));
//     children.add(
//         GestureDetector(onTap: () => Atlas.navigator.pop(), behavior: HitTestBehavior.opaque, child: Container(padding: Style.paddingInput, child: Text(Global.locale.cancel))));
//
//     return await dialog<T>(ModalBottom(Column(children: children)), direction: AxisDirection.up);
//   }
//
//   /// 对话框-警告
//   /// @param title 标题
//   /// @param content 内容
//   /// @return 结果
//   static Future<bool> dialogAlert({String? title, String? content}) async {
//     var res = await showDialog<bool>(
//         context: Atlas.context,
//         builder: (context) => AlertDialog(title: Text(title ?? ''), content: Text(content ?? ''), actions: [
//               TextButton(
//                   child: Text(Global.locale.cancel),
//                   onPressed: () {
//                     Atlas.navigator.pop(false);
//                   }),
//               TextButton(
//                   child: Text(Global.locale.ok),
//                   onPressed: () {
//                     Atlas.navigator.pop(true);
//                   })
//             ]));
//
//     return res ?? false;
//   }
//
//   /// 对话框-全屏
//   /// @param child 子组件
//   /// @param title 标题
//   static Future<void> dialogFull(Widget child, {String title = ''}) async {
//     await showModalBottomSheet(
//         context: Atlas.context,
//         isScrollControlled: true,
//         enableDrag: false,
//         builder: (context) => Container(padding: MediaQuery.of(Atlas.context).padding, child: Scaffold(appBar: Head(title), body: child)));
//   }
//
//   /// 播放音频
//   /// @param source 音频源
//   static Future<AudioPlayer> audio(String source) async {
//     rootBundle.load(source);
//
//     var data = await rootBundle.load(source);
//     var player = AudioPlayer();
//     player.play(BytesSource(data.buffer.asUint8List()));
//
//     return player;
//   }
//
//   /// 震动
//   /// @param duration 周期。单位：ms
//   /// @param pattern 规律
//   static void vibrate({int duration = 1000, List<int>? pattern}) async {
//     if ((await Vibration.hasVibrator()) ?? false) {
//       if (pattern != null) {
//         Vibration.vibrate(pattern: pattern);
//       } else {
//         Vibration.vibrate(duration: duration);
//       }
//     }
//   }
//
//   /// 闪光灯
//   /// @param duration 周期。单位：ms
//   /// @param pattern 规律
//   static void flashlight({int duration = 1000, List<int>? pattern}) async {
//     if (await TorchLight.isTorchAvailable()) {
//       if (pattern != null) {
//         for (var i = 0; i < pattern.length; i++) {
//           if (i.isEven) {
//             TorchLight.disableTorch();
//             await Future.delayed(Duration(milliseconds: pattern[i]));
//           }
//         }
//
//         TorchLight.disableTorch();
//       } else {
//         TorchLight.enableTorch();
//         await Future.delayed(Duration(milliseconds: duration));
//         TorchLight.disableTorch();
//       }
//     }
//   }
// }
//
// /// 通知
// class Notification {
//   static const String _channelId = 'common';
//   static const String _channelName = 'common';
//   static int _id = 0;
//   static final Map<int, NotificationCallback> _callbacks = {};
//
//   @pragma('vm:entry-point')
//   static void handleResponse(NotificationResponse response) {
//     var id = response.id;
//     _callbacks[id]?.call();
//     _callbacks.remove(id);
//   }
//
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   /// 构造方法
//   Notification() {
//     flutterLocalNotificationsPlugin.initialize(const InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher')),
//         onDidReceiveNotificationResponse: handleResponse, onDidReceiveBackgroundNotificationResponse: handleResponse);
//   }
//
//   /// 显示
//   /// @param title 标题
//   /// @param body 主体
//   /// @param callback 回调
//   Future<void> show(String title, String body, NotificationCallback callback) async {
//     if (await Permission.notification(request: true)) {
//       var id = _id++;
//       _callbacks[id] = callback;
//
//       await flutterLocalNotificationsPlugin.show(
//           id, title, body, const NotificationDetails(android: AndroidNotificationDetails(_channelId, _channelName, importance: Importance.max, priority: Priority.high)));
//     }
//   }
// }
//
// typedef NotificationCallback = FutureOr<void> Function();
