import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/full_forecast.dart';
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
}
