import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var donationProvider = ChangeNotifierProvider((ref) => DonationProvider());

class DonationProvider extends ChangeNotifier {
  double _amount = 0.0;

  double get amount => _amount;

  void setAmount(double value) {
    _amount = value;
    notifyListeners();
  }

  bool validate() {
    return _amount > 0;
  }
}
