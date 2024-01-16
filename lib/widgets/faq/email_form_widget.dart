import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';
import 'package:meditofundraising/utils/utils.dart';
import 'package:meditofundraising/utils/validation_utils.dart';
import 'package:meditofundraising/widgets/widgets.dart';

class EmailFormWidget extends StatefulWidget {
  const EmailFormWidget({super.key});

  @override
  State<EmailFormWidget> createState() => _EmailFormWidgetState();
}

class _EmailFormWidgetState extends State<EmailFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final _hintEmail = "xyz@medito.com";

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle(StringConstants.enterYourEmail),
          TextFormField(
            decoration: inputDecoration(hintText: _hintEmail),
            keyboardType: TextInputType.emailAddress,
            validator: ValidationUtils.validateEmail,
            onChanged: _handleEmailChanged,
          ),
          height12,
          _buildFieldTitle(StringConstants.question),
          TextFormField(
            decoration: inputDecoration().copyWith(
              floatingLabelAlignment: FloatingLabelAlignment.start,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            onChanged: _handleMessageChanged,
          ),
          height16,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: LoadingButtonWidget(
              btnText: StringConstants.submit,
              bgColor: ColorConstants.lightPurple,
              btnHeight: 52,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {}
              },
            ),
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

  void _handleEmailChanged(String name) {
    log(name);
  }

  void _handleMessageChanged(String message) {
    log(message);
  }
}
