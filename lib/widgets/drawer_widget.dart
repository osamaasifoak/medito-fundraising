// drawer_widget.dart

import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: ColorConstants.onyx,
            ),
            child: Text(
              StringConstants.meditoFundraising,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildListTile(context, StringConstants.donation),
          _buildListTile(context, StringConstants.qAndA),
          _buildListTile(context, StringConstants.rewards),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, String title) {
    return ListTile(
      title: Text(title, ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
