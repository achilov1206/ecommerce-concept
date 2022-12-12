import 'package:flutter/material.dart';

import './color_manager.dart';
import './font_manager.dart';
import './styles_manager.dart';

ThemeData getApplicationTheme() {
  const typeTheme = Typography.whiteMountainView;
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.primaryOpacity70,
    // primaryColorDark: ColorManager.darkPrimary,
    // will be used incase of disabled button for example
    // disabledColor: ColorManager.grey1,
    // ripple color
    splashColor: ColorManager.onBackground,
    //accentColor: ColorManager.grey
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: ColorManager.text1,
        ),
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.scaffoldBackgroundColor,
      elevation: 0,
      titleTextStyle: getRegularStyle(
        color: ColorManager.text1,
        fontSize: FontSize.s16,
      ),
    ),
    // Text theme
    textTheme: Typography.whiteMountainView.copyWith(
      bodyText1: typeTheme.bodyText1?.copyWith(
        fontSize: 18,
        color: ColorManager.text1,
        fontWeight: FontWeightManager.medium,
      ),
      bodyText2: typeTheme.bodyText2?.copyWith(
        fontSize: 16,
        color: ColorManager.text1,
        fontWeight: FontWeightManager.medium,
      ),
      headline1: typeTheme.headline1?.copyWith(
        fontSize: 25,
        color: ColorManager.text1,
        fontWeight: FontWeightManager.semiBold,
      ),
      headline2: typeTheme.headline2?.copyWith(
        fontSize: 18,
        color: ColorManager.text1,
        fontWeight: FontWeightManager.semiBold,
      ),
      headline3: typeTheme.headline3?.copyWith(
        fontSize: 16,
        color: ColorManager.text1,
        fontWeight: FontWeightManager.semiBold,
      ),
      headline4: typeTheme.headline4?.copyWith(
        fontSize: 25,
        color: ColorManager.white,
        fontWeight: FontWeightManager.semiBold,
      ),
      headline5: typeTheme.headline5?.copyWith(
        fontSize: 11,
        color: ColorManager.white,
        fontWeight: FontWeightManager.regular,
      ),
      headline6: typeTheme.headline6?.copyWith(
        fontSize: 10,
        color: ColorManager.grey,
        fontWeight: FontWeightManager.medium,
        decoration: TextDecoration.lineThrough,
      ),
      subtitle1: typeTheme.subtitle1?.copyWith(
        fontSize: 12,
        color: ColorManager.text1,
        fontWeight: FontWeightManager.regular,
      ),
      subtitle2: typeTheme.subtitle2?.copyWith(
        fontSize: 12,
        color: ColorManager.primary,
        fontWeight: FontWeightManager.medium,
      ),
      button: typeTheme.button?.copyWith(
        fontSize: 15,
        color: ColorManager.primary,
        fontWeight: FontWeightManager.regular,
      ),
    ),
  );
}
