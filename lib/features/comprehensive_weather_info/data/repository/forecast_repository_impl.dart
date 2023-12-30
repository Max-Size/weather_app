import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/constans.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/forecast/full_forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/forecast_repository.dart';

class ForecastRepositoryImpl implements FullForecastRepository{
  
  final WeatherApiService _weatherApiService;

  ForecastRepositoryImpl(this._weatherApiService);
  

  @override
  Future<FullForecastModel?> getForecast(String city) async{
    try{
      final httpResponse = await _weatherApiService.getForecast(
      language: 'ru',
      city: city,
      apiKey: apiKey,
      );
      if (httpResponse.statusCode == 200){
        final body = utf8.decode(httpResponse.bodyBytes);
        final json = jsonDecode(body) as Map<String, dynamic>;
        final forecast = FullForecastModel.fromJson(json);
        return forecast;
      }
      return null;
    }
    catch (error, stackTrace){
      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }


  
}
