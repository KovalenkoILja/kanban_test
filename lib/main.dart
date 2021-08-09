import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban_test/app.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(App());
  });
}
