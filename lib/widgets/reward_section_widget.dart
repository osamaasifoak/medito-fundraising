import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

class RewardsSectionWidget extends StatelessWidget {
  RewardsSectionWidget({super.key});

  final List<String> rewards = [
    'Tier 1: Bronze Donor - \$50',
    'Tier 2: Silver Donor - \$100',
    'Tier 3: Gold Donor - \$150',
    'Tier 4: Platinum Donor - \$200',
    'Tier 5: Diamond Donor - \$250'
  ];
  @override
  Widget build(BuildContext context) {
    var titleStyle = const TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, fontFamily: dmSans);
    var bodyStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: 14, color: ColorConstants.walterWhite, letterSpacing: -0.3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.donationTiersAndRewards,
          style: titleStyle,
        ),
        height8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rewards
              .map(
                (x) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: padding8,
                  ),
                  child: Text(
                    x,
                    style: bodyStyle,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
