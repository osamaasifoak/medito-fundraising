import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

import 'text_theme.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    splashColor: ColorConstants.ebony,
    canvasColor: ColorConstants.ebony,
    textTheme: meditoTextTheme(),
    colorScheme: const ColorScheme.dark(
      background: ColorConstants.ebony,
      secondary: ColorConstants.walterWhite,
    ),
  );
}
