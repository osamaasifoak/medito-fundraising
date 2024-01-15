import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditofundraising/constants/strings/asset_constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        AssetConstants.icMedito,
        height: 30,
      ),
    );
  }
}
