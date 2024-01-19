import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

import 'email_form_widget.dart';

class EmailFormExpansionPanelWidget extends StatefulWidget {
  const EmailFormExpansionPanelWidget({super.key});

  @override
  State<EmailFormExpansionPanelWidget> createState() =>
      _EmailFormExpansionPanelWidgetState();
}

class _EmailFormExpansionPanelWidgetState
    extends State<EmailFormExpansionPanelWidget> {
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
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: ColorConstants.onyx,
          body: const Padding(
            padding: EdgeInsets.all(padding16),
            child: EmailFormWidget(),
          ),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                StringConstants.isThereSomethingElse,
                style: bodyStyle,
              ),
            );
          },
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}
