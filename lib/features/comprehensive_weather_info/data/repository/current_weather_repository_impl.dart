import 'dart:convert';

import 'package:weather_app/core/constants/constans.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/current_weather_repository.dart';

class CurrentWeatherRepositoryImpl implements CurrentWeatherRepository {
  final WeatherApiService _weatherApiService;

  CurrentWeatherRepositoryImpl(this._weatherApiService);

  @override
  Future<CurrentWeatherModel?> getCurrentWeather(String city) async {
    try {
      final httpResponse = await _weatherApiService.getCurrentWeather(
        language: 'ru',
        city: city,
        apiKey: apiKey,
      );
      if (httpResponse.statusCode == 200) {
        final body = utf8.decode(httpResponse.bodyBytes);
        final json = jsonDecode(body) as Map<String, dynamic>;
        return CurrentWeatherModel.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
