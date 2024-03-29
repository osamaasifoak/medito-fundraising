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
            Padding(
              padding: const EdgeInsets.only(bottom: padding16),
              child: Column(
                children: [
                  const HeaderWidget(),
                  const TramWidget(),
                  _buildCampaignAndFundraising(context),
                  if (Responsive.isMobile(context))
                    _buildRecentDonationsWidget(),
                  if (Responsive.isMobile(context))
                    Column(
                      children: [
                        height16,
                        _buildFAQ(),
                      ],
                    ),
                  height16,
                ],
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCampaign(),
                if (Responsive.isDesktop(context) ||
                    Responsive.isTablet(context))
                  _buildRecentDonationsWidget(),
                height16,
                if (Responsive.isDesktop(context) ||
                    Responsive.isTablet(context))
                  _buildFAQ(),
              ],
            ),
          ),
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: _buildFundRaisingProgress(),
            ),
          ),
        ],
      );
    }
  }

  Container _buildFundRaisingProgress() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.onyx,
        borderRadius: BorderRadius.circular(borderRadius10),
      ),
      margin: const EdgeInsets.all(padding16),
      padding: const EdgeInsets.all(padding16),
      child: const Column(
        children: [
          FundraisingProgressWidget(),
          DonationFormWidget(),
        ],
      ),
    );
  }

  CampaignWidget _buildCampaign() {
    return const CampaignWidget(
      title: StringConstants.campaignTitle,
      description: StringConstants.campaignDescription,
    );
  }

  FAQListWidget _buildFAQ() {
    return FAQListWidget();
  }

  Padding _buildRecentDonationsWidget() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: padding16),
        child: RecentDonationsWidget(),
      );
}
