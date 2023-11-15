import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/main_screen/main_screen_model.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>().currentWeather;
    if (model == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          model.current!.condition!.icon!,
          scale: 0.5,
        ),
        const ConditionText(),
      ],
    );
  }
}

class ConditionText extends StatelessWidget {
  const ConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>().currentWeather;
    return Column(
      children: [
        Text(model!.current!.lastUpdated!),
        Text('${model.current!.tempC!.toInt()}°C'),
        Text(model.current!.condition!.text!),
      ],
    );
  }
}
