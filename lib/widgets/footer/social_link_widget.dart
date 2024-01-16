import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditofundraising/constants/constants.dart';
import 'package:meditofundraising/widgets/footer/footer_widget.dart';
import 'package:universal_html/html.dart' as html;

class SocialLinkWidget extends StatelessWidget {
  final SocialLink link;

  const SocialLinkWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          if (kIsWeb) {
            html.window.open(link.url, link.name);
          }
        },
        child: SvgPicture.asset(
          link.icon,
          theme: const SvgTheme(
            currentColor: ColorConstants.walterWhite,
          ),
        ),
      ),
    );
  }
}
