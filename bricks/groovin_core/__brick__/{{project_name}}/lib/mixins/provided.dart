import 'package:{{project_name}}/services/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin Provided<T extends StatefulWidget> on State<T> {
  PrefsService _prefsService;

  PrefsService get prefsService =>
      _prefsService ??= Provider.of<PrefsService>(context, listen: false);
}
