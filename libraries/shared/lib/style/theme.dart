import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../util/color_palettes.dart';

// Styling for text

class CustomTheme {
  final TextTheme textBlack = TextTheme(
    headline1: TextStyle(
      fontSize: 92,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: ColorPalettes().textBlack,
    ),
    headline2: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: ColorPalettes().textBlack,
    ),
    headline3: TextStyle(
      fontSize: 46,
      fontWeight: FontWeight.w400,
      color: ColorPalettes().textBlack,
    ),
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: ColorPalettes().textBlack,
    ),
    headline5: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
      color: ColorPalettes().textBlack,
    ),
    headline6: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: ColorPalettes().textBlack,
    ),
    subtitle1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: ColorPalettes().textBlack,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: ColorPalettes().textBlack,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: ColorPalettes().textBlack,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: ColorPalettes().textBlack,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: ColorPalettes().textBlack,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: ColorPalettes().textBlack,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: ColorPalettes().textBlack,
    ),
  );

  final TextTheme textWhite = TextTheme(
    headline1: TextStyle(
        fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: TextStyle(fontSize: 46, fontWeight: FontWeight.w400),
    headline4: TextStyle(
        fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
    headline6: TextStyle(
        fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: ColorPalettes().lightBlack,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: ColorPalettes().lightBlack,
      overflow: TextOverflow.ellipsis,
    ),
    button: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  final TextTheme textGrey = TextTheme(
    headline1: TextStyle(
      fontSize: 92,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: TextStyle(
      fontSize: 46,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: ColorPalettes().lightBlack,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: ColorPalettes().lightBlack,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: ColorPalettes().lightBlack,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: ColorPalettes().lightBlack,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: ColorPalettes().lightBlack,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: ColorPalettes().lightBlack,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: ColorPalettes().lightBlack,
    ),
  );
}

// Styling for light theme
ThemeData lightTheme = ThemeData(
  textTheme: CustomTheme().textBlack,
  primaryColor: Modular.get<ColorPalettes>().primaryColor,
  primaryColorDark: Modular.get<ColorPalettes>().primaryDark,
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(
          Modular.get<ColorPalettes>().primaryColor)),
  appBarTheme: AppBarTheme(
      elevation: 0,
      toolbarTextStyle: CustomTheme()
          .textBlack
          .apply(bodyColor: Modular.get<ColorPalettes>().primaryColor)
          .bodySmall,
      titleTextStyle: CustomTheme()
          .textBlack
          .apply(bodyColor: Modular.get<ColorPalettes>().textBlack)
          .subtitle1,
      backgroundColor: Modular.get<ColorPalettes>().lightBG,
      iconTheme: IconThemeData(color: Colors.black)),
  buttonTheme:
  ButtonThemeData(buttonColor: Modular.get<ColorPalettes>().primaryColor),
  progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Modular.get<ColorPalettes>().primaryColor),
);
