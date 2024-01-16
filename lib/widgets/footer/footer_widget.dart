import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

import 'social_link_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bodyStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: getDefaultBodyFontSize(context),
        color: ColorConstants.walterWhite,
        height: 1.2,
        letterSpacing: -0.1);
    List<SocialLink> links = [
      SocialLink(
        icon: AssetConstants.icTwitter,
        name: 'twitter',
        url: 'https://twitter.com/meditohq',
      ),
      SocialLink(
        icon: AssetConstants.icInstagram,
        name: 'instagram',
        url: 'https://www.instagram.com/meditohq/',
      ),
      SocialLink(
        icon: AssetConstants.icFacebook,
        name: 'facebook',
        url: 'https://www.facebook.com/MeditoHQ/',
      ),
      SocialLink(
        icon: AssetConstants.icLinkedIn,
        name: 'linkedin',
        url: 'https://www.linkedin.com/in/meditofoundation',
      ),
    ];

    return Container(
      color: ColorConstants.onyx,
      padding: const EdgeInsets.all(padding16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: links.map((e) => SocialLinkWidget(link: e)).toList(),
          ),
          height16,
          Text(
            StringConstants.license,
            textAlign: TextAlign.center,
            style: bodyStyle,
          ),
        ],
      ),
    );
  }
}

class SocialLink {
  final String url;
  final String icon;
  final String name;

  SocialLink({required this.url, required this.icon, required this.name});
}
