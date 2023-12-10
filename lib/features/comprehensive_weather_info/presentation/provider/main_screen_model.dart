import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_current_weather.dart';

class MainScreenModel extends ChangeNotifier {
  CurrentWeather? currentWeather;
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  MainScreenModel({required String city})
      : _getCurrentWeatherUseCase = GetIt.I.get<GetCurrentWeatherUseCase>() {
    _getCurrentWeather(city);
  }

  Future<void> _getCurrentWeather(String city) async {
    currentWeather = await _getCurrentWeatherUseCase(city);
    notifyListeners();
  }
}
