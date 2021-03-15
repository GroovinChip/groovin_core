import 'package:{{project_name}}/app.dart';
import 'package:{{project_name}}/services/prefs_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsService = await PrefsService.init();
  runApp(
    App(
      prefsService: prefsService,
    ),
  );
}
