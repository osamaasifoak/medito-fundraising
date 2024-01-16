import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

class FAQExpansionPanelWidget extends StatefulWidget {
  final String question;
  final String answer;

  const FAQExpansionPanelWidget(
      {super.key, required this.question, required this.answer});

  @override
  State<FAQExpansionPanelWidget> createState() =>
      _FAQExpansionPanelWidgetState();
}

class _FAQExpansionPanelWidgetState extends State<FAQExpansionPanelWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var bodyStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: getDefaultBodyFontSize(context),
          color: ColorConstants.walterWhite,
        );

    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.zero,
      expandIconColor: ColorConstants.lightPurple,
      dividerColor: ColorConstants.ebony,
      expansionCallback: (int _, bool isExpanded) {
        setState(() {
          _isExpanded = isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          backgroundColor: ColorConstants.onyx,
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                widget.question,
                style: bodyStyle,
              ),
            );
          },
          body: Container(
            color: ColorConstants.ebony,
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: padding16, horizontal: padding16),
                    child: Text(
                      widget.answer,
                      style:
                          bodyStyle?.copyWith(color: ColorConstants.graphite),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}
