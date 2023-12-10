import 'package:flutter/material.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';

class GridViewItem extends StatelessWidget {
  final CurrentWeather? currentWeather;

  const GridViewItem(this.currentWeather, {super.key});

  @override
  Widget build(BuildContext context) {
    if (currentWeather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromARGB(157, 52, 121, 211),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [Text(currentWeather?.location?.name ?? '')],
            ),
            Image.network(
              'https:${currentWeather!.current!.condition!.icon!}',
            ),
            Text(currentWeather?.current?.tempC.toString() ?? ''),
          ],
        ),
      ),
    );
  }
}
