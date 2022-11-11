import 'package:flutter_ume/flutter_ume.dart'; // UME framework
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI kits
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // Performance kits
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // Show Code
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // Device info
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // Show debugPrint


class Debug {
  static initiate () {
    PluginManager.instance                               // Register plugin kits
      ..register(WidgetInfoInspector())
      ..register(WidgetDetailInspector())
      ..register(ColorSucker())
      ..register(AlignRuler())
      ..register(ColorPicker())                            // New feature
      ..register(TouchIndicator())                         // New feature
      ..register(Performance())
      ..register(ShowCode())
      ..register(MemoryInfoPage())
      ..register(CpuInfoPage())
      ..register(DeviceInfoPanel())
      ..register(Console());

  }
}