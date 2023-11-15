import 'package:flutter/material.dart';
import 'package:weather_app/domain/api_client.dart';
import 'package:weather_app/domain/entities/current_weather/current_weather.dart';

class MainScreenModel extends ChangeNotifier{
  
  final _apiClient = ApiClient();
  CurrentWeather? currentWeather;

  MainScreenModel(){
    getCurrentWeather();
  }

  Future<void> getCurrentWeather() async{
    currentWeather = await _apiClient.getCurrentWeather(language: 'ru');
    notifyListeners();
  }
}