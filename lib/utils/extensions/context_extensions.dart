import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get themeData => Theme.of(this);

  double get topPadding => mediaQuery.padding.top;

  Size get screenSize => mediaQuery.size;

  TextTheme get textStyle => themeData.textTheme;

  double get bottomPadding => mediaQuery.padding.bottom;

  double get bottomInsets => mediaQuery.viewInsets.bottom;

  AppLocalizations get localization => AppLocalizations.of(this)!;
}