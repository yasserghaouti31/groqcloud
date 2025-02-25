import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> testSetup() async {
  // Load test environment variables
  await dotenv.load(fileName: "assets/key.env");
}
