import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_current_weather.dart';

class MainScreenModel extends ChangeNotifier{

  late final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  MainScreenModel({String city = 'auto:ip'}){
    _getCurrentWeatherUseCase = GetIt.I.get<GetCurrentWeatherUseCase>();
    getCurrentWeather(city);
  }
  
  //final _apiClient = ApiClient();
  CurrentWeather? currentWeather;

  Future<void> getCurrentWeather(String city) async{
    currentWeather = await _getCurrentWeatherUseCase(city);
    //currentWeather = await _apiClient.getCurrentWeather(language: 'ru');
    notifyListeners();
  }
  

}
