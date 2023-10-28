import 'package:DeveloperFolio/pages/layoutpage.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'configure/navigation_service.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  setupLocator();
  runApp(AppClass(savedThemeMode: savedThemeMode  ?? AdaptiveThemeMode.light));
}

class AppClass extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  const AppClass({super.key, required this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      dark: ThemeData(
        scaffoldBackgroundColor: Colors.black, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red,
          brightness: Brightness.dark).copyWith(background: Colors.black),
      ),
      initial: savedThemeMode,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DeveloperFolio',
        theme: theme,
        darkTheme: darkTheme,
        home: LayoutTemplate(),
      ),
    );
  }
}
