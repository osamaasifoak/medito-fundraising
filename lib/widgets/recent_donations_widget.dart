import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

class RecentDonationsWidget extends StatefulWidget {
  const RecentDonationsWidget({super.key});

  @override
  State<RecentDonationsWidget> createState() => _RecentDonationsWidgetState();
}

class _RecentDonationsWidgetState extends State<RecentDonationsWidget> {
  final ScrollController _scrollController = ScrollController();
  List<RecentDonation> recentDonations = [
    RecentDonation(
        donor: 'Romain',
        amount: '\$50',
        message: 'Donated to the wonderful community'),
    RecentDonation(donor: 'Osama', amount: '\$40', message: 'Stay strong 💪'),
    RecentDonation(
        donor: 'Mike', amount: '\$30', message: 'Keep up the good work'),
    RecentDonation(donor: 'Alex', amount: '\$1000', message: 'Woah!!'),
    RecentDonation(donor: 'Steven', amount: '\$90', message: 'Sample message'),
    RecentDonation(
      donor: 'Will',
      amount: '\$70',
    ),
    RecentDonation(donor: 'Arthur', amount: '\$100', message: 'Woah!!'),
    RecentDonation(donor: 'Azim', amount: '\$80', message: 'Sample message'),
    RecentDonation(
      donor: 'Gareth',
      amount: '\$70',
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController
          .animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 10),
            curve: Curves.easeOut,
          )
          .whenComplete(() => _scrollToTop());
    }
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController
          .animateTo(
            _scrollController.position.minScrollExtent,
            duration: const Duration(seconds: 10),
            curve: Curves.easeOut,
          )
          .whenComplete(() => _scrollToBottom());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: getDefaultTitleFontSize(context),
          color: Colors.white,
        );

    var bodyStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: getDefaultBodyFontSize(context),
        color: ColorConstants.graphite,
        letterSpacing: -0.3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.recentDonations,
          style: titleStyle,
        ),
        height12,
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: ColorConstants.onyx,
            borderRadius: BorderRadius.circular(borderRadius10),
          ),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: recentDonations.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: padding16,
                horizontal: padding16,
              ),
              itemBuilder: (context, index) {
                final donation = recentDonations[index];
                return _buildDonorCard(donation, titleStyle, bodyStyle);
              },
            ),
          ),
        ),
      ],
    );
  }

  Container _buildDonorCard(
      RecentDonation donation, TextStyle? titleStyle, TextStyle? bodyStyle) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.ebony,
        borderRadius: BorderRadius.circular(borderRadius10),
      ),
      margin: const EdgeInsets.only(bottom: padding12),
      padding:
          const EdgeInsets.symmetric(vertical: padding8, horizontal: padding16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: _buildTitle(donation, titleStyle),
        subtitle: _buildSubtitle(donation, bodyStyle),
      ),
    );
  }

  Text _buildTitle(RecentDonation donation, TextStyle? titleStyle) {
    return Text(
      '${donation.donor} donated ${donation.amount}',
      style: titleStyle?.copyWith(
          color: ColorConstants.lightPurple, fontSize: fontSize16),
    );
  }

  Widget? _buildSubtitle(RecentDonation donation, TextStyle? bodyStyle) {
    if (donation.message == null) {
      return null;
    }
    return Text(
      donation.message ?? '',
      style: bodyStyle,
    );
  }
}

class RecentDonation {
  final String? donor;
  final String amount;
  final String? message;

  RecentDonation({this.donor, required this.amount, this.message});
}
