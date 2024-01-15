import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditofundraising/constants/constants.dart';
import 'package:meditofundraising/constants/strings/string_constants.dart';
import 'package:meditofundraising/constants/styles/widget_styles.dart';
import 'package:meditofundraising/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _buildDrawer(context),
        body: Column(
          children: [
            _buildHeader(context),
            const CampaignWidget(
              title: StringConstants.campaignTitle,
              description: StringConstants.campaignDescription,
            )
          ],
        ));
  }

  Widget _buildHeader(BuildContext context) {
    return MediaQuery.of(context).size.width > minTabletSize
        ? const HeaderWidget()
        : AppBar(
            title: SvgPicture.asset(
              AssetConstants.icMedito,
              height: 30,
            ),
          );
  }

  Widget _buildDrawer(BuildContext context) {
    return MediaQuery.of(context).size.width < minTabletSize
        ? const DrawerWidget()
        : const SizedBox();
  }
}
