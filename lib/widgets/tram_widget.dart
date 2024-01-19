import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';
import 'package:meditofundraising/sample_data.dart';
import 'package:meditofundraising/utils/responsive_utils.dart';
import 'package:meditofundraising/widgets/widgets.dart';

class TramWidget extends StatefulWidget {
  const TramWidget({super.key});

  @override
  State<TramWidget> createState() => _TramWidgetState();
}

class _TramWidgetState extends State<TramWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var tramMinHeight =
        Responsive.isMobile(context) ? size.height * 0.15 : size.height * 0.1;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConstants.onyx,
        borderRadius: BorderRadius.circular(borderRadius14),
      ),
      margin: const EdgeInsets.all(padding16),
      padding: const EdgeInsets.all(padding16),
      constraints: BoxConstraints(minHeight: tramMinHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: AnimatedTextKit(
              animatedTexts: recentDonations
                  .map(
                    (e) => ScaleAnimatedText(
                      getFormattedTramMessage(e),
                      duration: const Duration(milliseconds: 5000),
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                          fontSize: getDefaultBodyFontSize(context),
                          fontFamily: dmSans,
                          color: ColorConstants.walterWhite),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  String getFormattedTramMessage(RecentDonation e) {
    String text = '';
    text = '${e.donor ?? 'Someone'} has donated';
    text = '$text ${e.amount}';
    text = '$text ${e.message != null ? '\n${e.message}' : ''}';

    return text;
  }
}
