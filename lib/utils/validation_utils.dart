import 'package:email_validator/email_validator.dart';
import 'package:meditofundraising/constants/constants.dart';

class ValidationUtils {
  static const _patternDigits = r'^[0-9]*$';

  static bool _isEmailValid(String email) {
    return EmailValidator.validate(email);
  }

  static String? validateDigit(String? digit, {String? errorMessage}) {
    var regexName = RegExp(_patternDigits);
    if (digit!.isEmpty) {
      return StringConstants.fieldRequired;
    } else if (regexName.hasMatch(digit)) {
      return null;
    } else {
      return StringConstants.enterValidNumber;
    }
  }

  static String? validateEmail(String? email, {String? errorMessage}) {
    if (email!.isEmpty) {
      return StringConstants.fieldRequired;
    } else if (_isEmailValid(email)) {
      return null;
    } else {
      return errorMessage ?? StringConstants.invalidEmail;
    }
  }

  static String? validateFieldEmpty(String? input, {String? errorMessage}) {
    return input!.isEmpty
        ? errorMessage ?? StringConstants.fieldRequired
        : null;
  }
}
