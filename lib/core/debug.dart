import 'package:flutter/foundation.dart';

import 'package:flutter_ume/flutter_ume.dart'; // UME framework
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI kits
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // Performance kits
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // Show Code
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // Device info
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // Show debugPrint


class Debug {
  static initiate () {
    PluginManager.instance                               // Register plugin kits
      ..register(const WidgetInfoInspector())
      ..register(const WidgetDetailInspector())
      ..register(const ColorSucker())
      ..register(AlignRuler())
      ..register(const ColorPicker())                            // New feature
      ..register(const TouchIndicator())                         // New feature
      ..register(Performance())
      ..register(const ShowCode())
      ..register(const MemoryInfoPage())
      ..register(CpuInfoPage())
      ..register(const DeviceInfoPanel())
      ..register(Console());



      if (kReleaseMode) {
        debugPrint = (String? message, {int? wrapWidth}) {};
      }

  }
}