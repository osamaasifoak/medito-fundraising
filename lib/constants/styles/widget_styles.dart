import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/colors/color_constants.dart';
import 'package:meditofundraising/utils/responsive_utils.dart';

const String materialIcons = 'MaterialIcons';
const String dmMono = 'DM Mono';
const String dmSans = 'DM Sans';
const borderRadius14 = 14.0;
const minTabletSize = 850;
const maxTabletSize = 1100;
const padding8 = 8.0;
const padding12 = 12.0;
const padding16 = 16.0;
const padding20 = 20.0;
const fontSize24 = 24.0;
const fontSize22 = 22.0;
const fontSize20 = 20.0;
const fontSize18 = 18.0;
const fontSize16 = 16.0;
const fontSize14 = 14.0;
const height32 = SizedBox(height: 32);
const height24 = SizedBox(height: 24);
const height16 = SizedBox(height: 16);
const height20 = SizedBox(height: 20);
const height12 = SizedBox(height: 12);
const height8 = SizedBox(height: 8);
const height6 = SizedBox(height: 6);
const height4 = SizedBox(height: 4);
const width16 = SizedBox(width: 16);
const width12 = SizedBox(width: 12);
const width8 = SizedBox(width: 8);
const width4 = SizedBox(width: 4);
const width2 = SizedBox(width: 2);

const outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(borderRadius14),
  ),
);

InputDecoration inputDecoration({String? label, String? hintText}) =>
    InputDecoration(
      labelText: label,
      hintText: hintText,
      labelStyle: const TextStyle(
          fontFamily: dmSans, color: ColorConstants.walterWhite),
      filled: true,
      border: InputBorder.none,
      enabledBorder: outlineBorder,
      focusedBorder: outlineBorder,
      focusedErrorBorder: outlineBorder,
      errorBorder: outlineBorder,
      contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 18.0, top: 15.0),
    );

double getDefaultTitleFontSize(BuildContext context) {
  if (Responsive.isMobile(context)) {
    return fontSize16;
  } else if (Responsive.isTablet(context)) {
    return fontSize20;
  } else if (Responsive.isDesktop(context)) {
    return fontSize24;
  }
  return fontSize24;
}

double getDefaultBodyFontSize(BuildContext context) {
  if (Responsive.isMobile(context)) {
    return fontSize14;
  } else if (Responsive.isTablet(context)) {
    return fontSize16;
  } else if (Responsive.isDesktop(context)) {
    return fontSize18;
  }
  return fontSize18;
}
