import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/main_screen_model.dart';

class TodayHourlyForecastWidget extends StatelessWidget {
  const TodayHourlyForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();
    if (model.forecast == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: SizedBox(
        height: 105,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: model
                  .getActualForecast()
                  ?.map(
                    (e) => HourlyForecastListItem(
                      time: e.time?.split(' ')[1] ?? '',
                      conditionImageUrl: 'https:${e.condition?.icon}',
                      tempC: e.tempC!.toInt(),
                    ),
                  )
                  .toList() ??
              [],
        ),
      ),
    );
  }
}

class HourlyForecastListItem extends StatelessWidget {
  final String time;
  final String conditionImageUrl;
  final int tempC;

  const HourlyForecastListItem({
    super.key,
    required this.time,
    required this.conditionImageUrl,
    required this.tempC,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(time),
          Image.network(conditionImageUrl),
          Text(tempC.toString()),
        ],
      ),
    );
  }
}
