import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';
import 'package:meditofundraising/utils/responsive_utils.dart';
import 'package:meditofundraising/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWidget(),
          _buildCampaignAndFundraising(context),
        ],
      ),
    ));
  }

  Widget _buildCampaignAndFundraising(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          _buildCampaign(),
          _buildFundRaisingProgress(),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: _buildCampaign(),
          ),
          Flexible(
            child: _buildFundRaisingProgress(),
          ),
        ],
      );
    }
  }

  FundraisingProgressWidget _buildFundRaisingProgress() =>
      const FundraisingProgressWidget();

  CampaignWidget _buildCampaign() {
    return const CampaignWidget(
      title: StringConstants.campaignTitle,
      description: StringConstants.campaignDescription,
    );
  }
}
