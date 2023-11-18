import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/main_screen/main_screen_model.dart';
import 'package:weather_app/presentation/main_screen/widgets/condition_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();

    return Scaffold(
      backgroundColor: const Color(0xFF47BFDF),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(model.currentWeather?.location?.name ?? ''),
            const WeatherCondition(),
          ],
        ),
      ),
    );
  }
}
