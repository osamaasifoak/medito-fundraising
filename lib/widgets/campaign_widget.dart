// fundraising_info_widget.dart

import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';
import 'package:meditofundraising/constants/styles/widget_styles.dart';

class CampaignWidget extends StatelessWidget {
  final String title;
  final String description;

  const CampaignWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding16),
      decoration: BoxDecoration(
        color: ColorConstants.onyx,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: _getTitleFontSize(context),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(
              fontSize: _getDescriptionFontSize(context),
              color: Colors.white, // Adjust color based on your design
            ),
          ),
        ],
      ),
    );
  }

  double _getTitleFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width > minTabletSize ? 24.0 : 20.0;
  }

  double _getDescriptionFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width > minTabletSize ? 18.0 : 16.0;
  }
}
