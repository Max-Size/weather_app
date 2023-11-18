import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/main_screen/main_screen_model.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>().currentWeather;
    if (model == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final image = Image.network(
      'https:${model.current!.condition!.icon!}',
      scale: 0.5,
    );
    return Column(
      children: [
        image,
        const ConditionText(),
      ],
    );
  }
}

class ConditionText extends StatelessWidget {
  const ConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>().currentWeather;
    return Card(
      color: const Color.fromRGBO(255, 255, 255, 0.7),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model!.current!.lastUpdated!),
            Text(
              '${model.current!.tempC!.toInt()}°C',
              style: const TextStyle(fontSize: 40),
            ),
            Text(model.current!.condition!.text!),
            const WindAndHumInfoWIdget(),
          ],
        ),
      ),
    );
  }
}

class WindAndHumInfoWIdget extends StatelessWidget {
  const WindAndHumInfoWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>().currentWeather;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              width: 150,
            ),
            const Positioned(
              left: 0,
              child: Text('Ветер'),
            ),
            const MyDivider(),
            Positioned(
              right: 0,
              child: Text('${model!.current!.windKph}км/ч'),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Влажность'),
            const MyDivider(),
            Text('${model.current!.humidity}%'),
          ],
        ),
      ],
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black54,
        ),
        width: 0.5,
        height: 14,
      ),
    );
  }
}
