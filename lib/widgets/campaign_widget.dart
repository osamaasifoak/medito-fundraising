// fundraising_info_widget.dart

import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/colors/color_constants.dart';
import 'package:meditofundraising/constants/styles/widget_styles.dart';

class CampaignWidget extends StatelessWidget {
  final String title;
  final String description;

  const CampaignWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: _getTitleFontSize(context),
          color: Colors.white,
        );
    var bodyStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: _getDescriptionFontSize(context),
        color: ColorConstants.graphite,
        letterSpacing: -0.3);

    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: bodyStyle,
          ),
        ],
      ),
    );
  }

  double _getTitleFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width > minTabletSize
        ? fontSize24
        : fontSize20;
  }

  double _getDescriptionFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width > minTabletSize
        ? fontSize18
        : fontSize16;
  }
}
