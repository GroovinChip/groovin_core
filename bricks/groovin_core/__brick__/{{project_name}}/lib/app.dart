import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:{{project_name}}/screens/home_screen.dart';
import 'package:{{project_name}}/services/prefs_service.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.prefsService,
  }) : super(key: key);

  final PrefsService prefsService;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PrefsService>.value(value: prefsService),
      ],
      child: StreamBuilder<ThemeMode>(
        stream: prefsService.themeModeSubject,
        initialData: prefsService.themeModeSubject.value,
        builder: (context, snapshot) {
          return MaterialApp(
            title: '{{project_name}}',
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.indigo,
              accentColor: Colors.indigoAccent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.indigo,
              accentColor: Colors.indigoAccent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            themeMode: ThemeMode.system,
            home: HomeScreen(),
          );
        }
      ),
    );
  }
}
