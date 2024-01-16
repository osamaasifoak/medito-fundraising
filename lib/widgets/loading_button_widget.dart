import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

class LoadingButtonWidget extends StatelessWidget {
  const LoadingButtonWidget({
    super.key,
    this.onPressed,
    required this.btnText,
    this.bgColor = ColorConstants.quiteGrey,
    this.textColor = ColorConstants.walterWhite,
    this.isLoading = false,
    this.elevation = 0,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 14,
    this.btnHeight = 48,
  });
  final void Function()? onPressed;
  final String btnText;
  final Color bgColor;
  final Color textColor;
  final bool isLoading;
  final double elevation;
  final double btnHeight;
  final FontWeight fontWeight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: isLoading ? null : onPressed,
      elevation: elevation,
      disabledColor: bgColor.withOpacity(0.7),
      color: bgColor,
      splashColor: ColorConstants.transparent,
      height: btnHeight,
      padding: const EdgeInsets.symmetric(horizontal: padding16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildBtnText(context),
          if (isLoading) _buildLoader(),
        ],
      ),
    );
  }

  Text _buildBtnText(BuildContext context) {
    return Text(
      btnText,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: isLoading ? Colors.transparent : textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }

  SizedBox _buildLoader() {
    return SizedBox(
      height: 16,
      width: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: textColor,
      ),
    );
  }
}
