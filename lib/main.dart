import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:meditofundraising/constants/strings/string_constants.dart';
import 'package:meditofundraising/constants/theme/app_theme.dart';
import 'package:meditofundraising/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  usePathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: appTheme(context),
        title: StringConstants.meditoFundraising,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
