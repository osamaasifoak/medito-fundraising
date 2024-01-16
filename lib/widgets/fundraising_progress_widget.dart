import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

class FundraisingProgressWidget extends StatefulWidget {
  const FundraisingProgressWidget({super.key});

  @override
  State<FundraisingProgressWidget> createState() =>
      _FundraisingProgressWidgetState();
}

class _FundraisingProgressWidgetState extends State<FundraisingProgressWidget>
    with SingleTickerProviderStateMixin {
  double amountRaised = 5000;
  double goalAmount = 10000;
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _progressAnimation = Tween<double>(begin: 0, end: amountRaised / goalAmount)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          StringConstants.amountRaised,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '${amountRaised.toStringAsFixed(2)} \$ / ${goalAmount.toStringAsFixed(2)} \$',
          style: TextStyle(
              fontSize: getDefaultBodyFontSize(context),
              fontWeight: FontWeight.bold),
        ),
        height16,
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius14),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: _progressAnimation.value,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(
              ColorConstants.lightPurple,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${(_progressAnimation.value * 100).toStringAsFixed(2)}%',
          style: TextStyle(
              fontSize: getDefaultBodyFontSize(context),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
