import 'package:flutter_dotenv/flutter_dotenv.dart';

final String stripePublishableKey = dotenv.env['publishable_key'] ?? '';
final String stripeSecretKey = dotenv.env['secret_key'] ?? '';
