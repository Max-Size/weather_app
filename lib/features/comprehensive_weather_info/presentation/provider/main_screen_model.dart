import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/full_forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/hour.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_forecast.dart';

enum PeriodOfDay {
  morning,
  day,
  evening,
  night,
}

class MainScreenModel extends ChangeNotifier {
  CurrentWeather? currentWeather;
  FullForecast? _fullForecast;
  Forecast? forecast;
  final GetForecastUsecase _getForecastUsecase;

  MainScreenModel({required String city})
      : _getForecastUsecase = GetIt.I.get<GetForecastUsecase>() {
    _getCurrentWeather(city);
  }

  Future<void> _getCurrentWeather(String city) async {
    _fullForecast = await _getForecastUsecase(city);
    currentWeather = CurrentWeather(
      location: _fullForecast?.location,
      current: _fullForecast?.current,
    );
    forecast = _fullForecast?.forecast;
    notifyListeners();
  }

  // TODO(maxsize): correct the forecast with local time 
  List<Hour>? getActualForecast() {
    final timeInHour = DateTime.now().hour;
    final filteredTodayForecast = forecast!.forecastday?[0].hour
        ?.where(
          (element) =>
              DateTime.tryParse('${element.time!}:00')!.hour >= timeInHour,
        )
        .toList();
    final actualForecastSize = filteredTodayForecast?.length;
    final listForAdding = forecast!.forecastday?[1].hour
        ?.getRange(0, 24 - actualForecastSize!)
        .toList();
    filteredTodayForecast?.addAll(listForAdding!);
    return filteredTodayForecast;
  }

  String getForecastDayTitle(int dayIndex) {
    final dateString =
        forecast?.forecastday?[dayIndex].date?.split(' ')[0] ?? '';
    final date = DateTime.tryParse(dateString);
    return date == null ? '' : DateFormat('EEEE, d MMMM').format(date);
  }

  String getConditionIconUrl(int dayIndex, PeriodOfDay timeOfDay) {
    switch (timeOfDay) {
      case PeriodOfDay.morning:
        return  'https:${forecast?.forecastday?[dayIndex].hour?[5]
                              .condition?.icon}';
      case PeriodOfDay.day:
        return  'https:${forecast?.forecastday?[dayIndex].hour?[11]
                              .condition?.icon}';
      case PeriodOfDay.evening:
        return  'https:${forecast?.forecastday?[dayIndex].hour?[17]
                              .condition?.icon}';
      case PeriodOfDay.night:
        return  'https:${forecast?.forecastday?[dayIndex].hour?[23]
                              .condition?.icon}';
    }
  }
}
