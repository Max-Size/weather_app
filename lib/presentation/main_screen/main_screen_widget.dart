import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/entities/current_weather/condition.dart';
import 'package:weather_app/presentation/main_screen/main_screen_model.dart';
import 'package:weather_app/presentation/main_screen/widgets/condition_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(40, 136, 0, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(model.currentWeather?.location?.name ?? '')],
              ),
              const WeatherCondition(),
            ],
          ),
        ),
      ),
    );
  }
}
