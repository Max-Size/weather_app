import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/main_screen_model.dart';

class NextDayForecastWidget extends StatelessWidget {
  final int dayIndex;

  const NextDayForecastWidget({super.key, required this.dayIndex});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();
    final forecastDay = model.forecast?.forecastday?[dayIndex].hour;
    return model.forecast == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(20),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      model.getForecastDayTitle(dayIndex),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ForecastRow(
                    timeDay: 'Утро',
                    imageUrl: model.getConditionIconUrl(
                      dayIndex,
                      PeriodOfDay.morning,
                    ),
                    tempC: forecastDay?[5].tempC?.toInt() ?? 0,
                  ),
                  ForecastRow(
                    timeDay: 'День',
                    imageUrl: model.getConditionIconUrl(
                      dayIndex,
                      PeriodOfDay.day,
                    ),
                    tempC: forecastDay?[11].tempC?.toInt() ?? 0,
                  ),
                  ForecastRow(
                    timeDay: 'Вечер',
                    imageUrl: model.getConditionIconUrl(
                      dayIndex,
                      PeriodOfDay.evening,
                    ),
                    tempC: forecastDay?[17].tempC?.toInt() ?? 0,
                  ),
                  ForecastRow(
                    timeDay: 'Ночь',
                    imageUrl: model.getConditionIconUrl(
                      dayIndex,
                      PeriodOfDay.evening,
                    ),
                    tempC: forecastDay?[23].tempC?.toInt() ?? 0,
                  ),
                ],
              ),
            ),
          );
  }
}

class ForecastRow extends StatelessWidget {
  final String timeDay;
  final String imageUrl;
  final int tempC;

  const ForecastRow({
    super.key,
    required this.timeDay,
    required this.imageUrl,
    required this.tempC,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2.5,
      ),
      child: Row(
        children: [
          Text(
            timeDay,
          ),
          Image.network(
            imageUrl,
          ),
          Text('$tempC°C'),
        ],
      ),
    );
  }
}
