import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meditofundraising/constants/colors/color_constants.dart';
import 'package:meditofundraising/constants/strings/keys_constants.dart';
import 'package:meditofundraising/constants/strings/string_constants.dart';
import 'package:meditofundraising/constants/styles/widget_styles.dart';
import 'package:meditofundraising/providers/donation_form_provider.dart';
import 'package:meditofundraising/utils/utils.dart';
import 'package:meditofundraising/utils/validation_utils.dart';
import 'package:meditofundraising/widgets/widgets.dart';

class DonationFormWidget extends ConsumerStatefulWidget {
  const DonationFormWidget({super.key});

  @override
  ConsumerState<DonationFormWidget> createState() => _DonationFormWidgetState();
}

class _DonationFormWidgetState extends ConsumerState<DonationFormWidget>
    with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _paymentIntentClientSecret = stripeSecretKey;
  final _merchantDisplayName = 'Your App Name';
  final _hintEmail = "xyz@medito.com";
  final _hintDonationAmount = "0.0";
  final List<String> currencies = ['USD', 'PKR', 'EUR', 'CAD'];
  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFieldTitle(StringConstants.enterYourName),
          TextFormField(
            decoration: inputDecoration(),
            keyboardType: TextInputType.name,
            validator: ValidationUtils.validateFieldEmpty,
            onChanged: _handleNameChanged,
          ),
          height12,
          _buildFieldTitle(StringConstants.enterYourEmail),
          TextFormField(
            decoration: inputDecoration(hintText: _hintEmail),
            keyboardType: TextInputType.emailAddress,
            validator: ValidationUtils.validateEmail,
            onChanged: _handleEmailChanged,
          ),
          height12,
          _buildFieldTitle(StringConstants.enterDonationAmount),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextFormField(
                  decoration: inputDecoration(hintText: _hintDonationAmount),
                  keyboardType: TextInputType.number,
                  validator: ValidationUtils.validateDigit,
                  onChanged: _handleDonationChanged,
                ),
              ),
              width12,
              _buildCurrencyDropdown()
            ],
          ),
          height12,
          _buildFieldTitle(StringConstants.messageToCommunity),
          TextFormField(
            decoration: inputDecoration().copyWith(
              floatingLabelAlignment: FloatingLabelAlignment.start,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            onChanged: _handleMessageChanged,
          ),
          height16,
          RewardsSectionWidget(),
          height24,
          LoadingButtonWidget(
            btnText: StringConstants.donateNow,
            bgColor: ColorConstants.lightPurple,
            btnHeight: 52,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (ref.read(donationProvider.notifier).validate()) {
                  await Stripe.instance.initPaymentSheet(
                    paymentSheetParameters: SetupPaymentSheetParameters(
                      paymentIntentClientSecret: _paymentIntentClientSecret,
                      merchantDisplayName: _merchantDisplayName,
                    ),
                  );
                  await Stripe.instance.presentPaymentSheet();
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Padding _buildFieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: padding12, bottom: padding8),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: dmSans,
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdown() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius14),
          color: ColorConstants.ebony),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: padding8),
      child: DropdownButton(
        value: selectedCurrency,
        borderRadius: BorderRadius.circular(borderRadius14),
        underline: const SizedBox(),
        items: currencies.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedCurrency = value ?? selectedCurrency;
          });
        },
      ),
    );
  }

  void _handleDonationChanged(String amount) {
    ref
        .read(donationProvider.notifier)
        .setAmount(double.tryParse(amount) ?? 0.0);
  }

  void _handleEmailChanged(String email) {
    log(email);
  }

  void _handleNameChanged(String name) {
    log(name);
  }

  void _handleMessageChanged(String message) {
    log(message);
  }
}
