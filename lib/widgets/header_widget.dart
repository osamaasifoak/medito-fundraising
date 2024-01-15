import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditofundraising/constants/strings/asset_constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      title: Row(
        children: [
          SvgPicture.asset(
            AssetConstants.icMedito,
            height: 30,
          ),
        ],
      ),
      actions: [
        _buildMenuItem(MenuItems.home),
        _buildMenuItem(MenuItems.about),
        _buildMenuItem(MenuItems.contact),
      ],
    );
  }

  Widget _buildMenuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          // Handle menu item click
        },
        child: Text(title),
      ),
    );
  }
}

class MenuItems {
  static const String home = 'Home';
  static const String about = 'About';
  static const String contact = 'Contact';
}
