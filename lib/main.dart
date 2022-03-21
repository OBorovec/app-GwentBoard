import 'package:flutter/material.dart';
import 'package:gwent_board/app_theme.dart';
import 'package:gwent_board/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gwent Board',
      theme: appTheme,
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(
        settings,
      ),
    );
  }
}
