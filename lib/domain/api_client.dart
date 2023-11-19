import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/constans.dart';
import 'package:weather_app/data/models/current_weather/current_weather.dart';
import 'package:weather_app/domain/entities/current_weather/current_weather.dart';

class ApiClient {
  

  Future<CurrentWeather?> getCurrentWeather({
    required String language,
    String city = 'auto:ip',
  }) async {
    final queryParameters = <String, dynamic>{
      'key': apiKey,
      'q': city,
      'lang': language,
    };
    try {
      final url = Uri.http(apiHost, apiGetCurrentWeatherPath, queryParameters);
      debugPrint(url.toString());
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = utf8.decode(response.bodyBytes);
        final json = jsonDecode(body) as Map<String, dynamic>;
        return CurrentWeatherModel.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
