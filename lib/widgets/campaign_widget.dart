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
          fontSize: getDefaultTitleFontSize(context),
          color: Colors.white,
        );
    var bodyStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: getDefaultBodyFontSize(context),
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
}
