import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/full_forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/hour.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_forecast.dart';

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
        ?.getRange(0, 24 - actualForecastSize!).toList();
    filteredTodayForecast?.addAll(listForAdding!);
    return filteredTodayForecast;
  }
}
