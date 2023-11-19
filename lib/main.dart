import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/pages/main_screen_widget.dart';
import 'package:weather_app/presentation/provider/main_screen_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => MainScreenModel(),
        child: const MainScreen(),
      ),
    );
  }
}
