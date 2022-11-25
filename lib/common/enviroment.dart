import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }
    return '.env.development';
  }

  static get ulrBase {
    return dotenv.env['BASE_URL'] ?? 'Not found';
  }

  static get apiKey {
    return dotenv.env['API_KEY'] ?? 'No found';
  }
}
