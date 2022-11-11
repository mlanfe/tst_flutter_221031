import 'package:flutter/material.dart';
import './router/router.dart';

/// 主题
class Style {
  static const Color colorGray1 = Color.fromRGBO(66, 66, 66, 1);
  static const Color colorGray2 = Color.fromRGBO(95, 95, 95, 1);
  static const Color colorGray3 = Color.fromRGBO(111, 111, 111, 1);
  static const Color colorGray4 = Color.fromRGBO(133, 133, 133, 1);
  static const Color colorGray5 = Color.fromRGBO(146, 146, 146, 1);
  static const Color colorGray6 = Color.fromRGBO(175, 175, 175, 1);
  static const Color colorGray7 = Color.fromRGBO(205, 205, 205, 1);
  static const Color colorGray8 = Color.fromRGBO(229, 229, 229, 1);
  static const Color colorGray9 = Color.fromRGBO(247, 247, 247, 1);
  static const Color colorRed1 = Color.fromRGBO(175, 44, 67, 1);
  static const Color colorRed2 = Color.fromRGBO(213, 19, 23, 1);
  static const Color colorRed3 = Color.fromRGBO(255, 32, 32, 1);
  static const Color colorRed4 = Color.fromRGBO(255, 223, 223, 1);
  static const Color colorOrange = Color.fromRGBO(239, 156, 51, 1);
  static const Color colorYellow1 = Color.fromRGBO(243, 190, 0, 1);
  static const Color colorYellow2 = Color.fromRGBO(247, 210, 62, 1);
  static const Color colorYellow3 = Color.fromRGBO(253, 237, 191, 1.0);
  static const Color colorGreen1 = Color.fromRGBO(80, 144, 83, 1);
  static const Color colorGreen2 = Color.fromRGBO(68, 148, 136, 1);
  static const Color colorGreen3 = Color.fromRGBO(6, 166, 107, 1);
  static const Color colorGreen4 = Color.fromRGBO(127, 190, 119, 1);
  static const Color colorGreen5 = Color.fromRGBO(45, 211, 111, 1.0);
  static const Color colorGreen6 = Color.fromRGBO(223, 255, 235, 1);
  static const Color colorCyan = Color.fromRGBO(55, 165, 198, 1);
  static const Color colorBlue1 = Color.fromRGBO(32, 86, 141, 1);
  static const Color colorBlue2 = Color.fromRGBO(58, 83, 215, 1);
  static const Color colorBlue3 = Color.fromRGBO(61, 133, 207, 1);
  static const Color colorBlue4 = Color.fromRGBO(70, 136, 249, 1);
  static const Color colorBlue5 = Color.fromRGBO(75, 161, 248, 1);
  static const Color colorBlue6 = Color.fromRGBO(198, 229, 250, 1.0);
  static const Color colorBrown = Color.fromRGBO(97, 80, 18, 1);

  static const colorLink = colorBlue3;
  static const colorBackground = colorGray9;
  static const colorBorder = colorGray8;
  static const colorMain = colorGray1;
  static const colorSub = colorGray5;

  static const double gapLarge = 32;
  static const double gapMain = 16;
  static const double gapSub = 10;
  static const double gapSmall = 4;

  static const EdgeInsets paddingLarge = EdgeInsets.symmetric(horizontal: gapLarge, vertical: gapLarge);
  static const EdgeInsets paddingMain = EdgeInsets.symmetric(horizontal: gapMain, vertical: gapMain);
  static const EdgeInsets paddingSub = EdgeInsets.symmetric(horizontal: gapSub, vertical: gapSub);
  static const EdgeInsets paddingSmall = EdgeInsets.symmetric(horizontal: gapSmall, vertical: gapSmall);
  static const EdgeInsets paddingHorizontalLarge = EdgeInsets.symmetric(horizontal: gapLarge);
  static const EdgeInsets paddingHorizontalMain = EdgeInsets.symmetric(horizontal: gapMain);
  static const EdgeInsets paddingHorizontalSub = EdgeInsets.symmetric(horizontal: gapSub);
  static const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(horizontal: gapSmall);
  static const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(vertical: gapLarge);
  static const EdgeInsets paddingVerticalMain = EdgeInsets.symmetric(vertical: gapMain);
  static const EdgeInsets paddingVerticalSub = EdgeInsets.symmetric(vertical: gapSub);
  static const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(vertical: gapSmall);

  static const EdgeInsets paddingPage = EdgeInsets.symmetric(horizontal: gapMain, vertical: gapMain);
  static const EdgeInsets paddingInput = EdgeInsets.symmetric(horizontal: gapSub, vertical: gapSub);
  static const EdgeInsets paddingTag = EdgeInsets.symmetric(horizontal: 8, vertical: 2);

  static const SizedBox marginHorizontalLarge = SizedBox(width: gapLarge);
  static const SizedBox marginHorizontalMain = SizedBox(width: gapMain);
  static const SizedBox marginHorizontalSub = SizedBox(width: gapSub);
  static const SizedBox marginHorizontalSmall = SizedBox(width: gapSmall);
  static const SizedBox marginVerticalLarge = SizedBox(height: gapLarge);
  static const SizedBox marginVerticalMain = SizedBox(height: gapMain);
  static const SizedBox marginVerticalSub = SizedBox(height: gapSub);
  static const SizedBox marginVerticalSmall = SizedBox(height: gapSmall);

  static const double iconSizeDefault = 24;
  static const double iconSizeMain = 16;
  static const double iconSizeSub = 8;

  static const double borderWidth = 0.5;

  static BorderRadius radiusLarge = BorderRadius.circular(6);
  static BorderRadius radiusMain = BorderRadius.circular(4);
  static BorderRadius radiusSmall = BorderRadius.circular(2);

  static const double fontSizeLarge = 16;
  static const double fontSizeMain = 14;
  static const double fontSizeSub = 12;
  static const double fontSizeSmall = 10;

  static const double disableOpacity = 0.5;

  static const double refreshIndicatorSize = 50;
  static const double checkboxSize = 18;
  static const double dialogHeight = 300;

  static Widget borderMain = Container(decoration: const BoxDecoration(border: Border(top: BorderSide(width: borderWidth, color: colorBorder))));
  static const TextStyle textStyleTitle = TextStyle(color: colorGray1, fontSize: fontSizeLarge, fontWeight: FontWeight.bold);
  static const TextStyle textStyleKey = TextStyle(color: colorGray1, fontSize: fontSizeMain, fontWeight: FontWeight.normal);
  static const TextStyle textStyleValue = TextStyle(color: colorGray4, fontSize: fontSizeMain, fontWeight: FontWeight.normal);
  static const Widget iconArrowRight = Icon(Icons.keyboard_arrow_right, size: iconSizeMain, color: colorSub);
  static const Widget iconClear = Icon(Icons.highlight_remove, size: iconSizeMain, color: colorSub);
  static const Widget iconCalendar = Icon(Icons.calendar_month, size: iconSizeMain, color: colorSub);
  static const Widget iconEdit = Icon(Icons.edit, size: iconSizeMain, color: colorSub);
  static const Widget iconSearch = Icon(Icons.search, color: Style.colorSub, size: Style.iconSizeMain);

  static ThemeData theme = ThemeData(
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: colorGray9,
      appBarTheme: const AppBarTheme(
          // backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: fontSizeLarge),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black, //修改颜色
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white, unselectedItemColor: Style.colorGray4, selectedItemColor: Style.colorBlue3),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: colorBlue3),
      inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none, hintStyle: TextStyle(color: colorGray7, fontSize: fontSizeMain), focusColor: colorBlue3),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(0, 0)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              foregroundColor: MaterialStateProperty.all(colorBlue3),
              textStyle: MaterialStateTextStyle.resolveWith((states) => const TextStyle(color: colorBlue3, fontWeight: FontWeight.w400)))),
      tabBarTheme: const TabBarTheme(unselectedLabelColor: colorGray4, labelColor: colorBlue3, indicator: BoxDecoration(border: Border(bottom: BorderSide(color: colorBlue3)))),
      expansionTileTheme:
          const ExpansionTileThemeData(tilePadding: EdgeInsets.zero, childrenPadding: EdgeInsets.symmetric(horizontal: gapSub), textColor: Colors.black, iconColor: Colors.black),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? colorBlue3 : colorGray6),
          trackColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? colorBlue6 : colorGray8)),
      radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? colorBlue3 : colorGray6)),
      checkboxTheme: CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? colorBlue3 : colorGray6)));

  static double get deviceWidth {
    return MediaQuery.of(TstRouter.context).size.width;
  }

  static double get deviceHeight {
    return MediaQuery.of(TstRouter.context).size.height;
  }
}
