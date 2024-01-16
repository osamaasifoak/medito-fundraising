import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

import 'email_form_expansion_panel_widget.dart';
import 'faq_expansion_panel_widget.dart';

class FAQListWidget extends StatelessWidget {
  FAQListWidget({super.key});
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is the fundraising goal?',
      answer: 'Our goal is to raise \$10,000 for a specific cause.',
    ),
    FAQItem(
      question: 'How can I donate?',
      answer: 'You can donate by clicking on the "Donate Now" button.',
    ),
    FAQItem(
      question: 'Is my donation secure?',
      answer: 'Yes, we use Stripe for secure and reliable payment processing.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: getDefaultTitleFontSize(context),
          color: Colors.white,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.faq,
            style: titleStyle,
          ),
          height16,
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius14),
            child: Column(
              children: [
                for (var faqItem in faqItems)
                  FAQExpansionPanelWidget(
                    question: faqItem.question,
                    answer: faqItem.answer,
                  ),
                const EmailFormExpansionPanelWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
