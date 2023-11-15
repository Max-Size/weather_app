import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/entities/current_weather/current_weather.dart';

class ApiClient {
  static const _apiKey = '0b431d1cafe241cda62102619231411';
  static const _host = 'api.weatherapi.com';
  static const _getCurrentWeatherPath = '/v1/current.json';

  Future<CurrentWeather?> getCurrentWeather({required String language, String city = 'auto:ip'}) async{
    final queryParameters = <String, dynamic>{
      'key':_apiKey,
      'q':city,
      'lang':language
    };
    try{
      final url = Uri.http(_host,_getCurrentWeatherPath,queryParameters);
      debugPrint(url.toString());
      final response = await http.get(url);
      if(response.statusCode == 200) {
        final body = utf8.decode(response.bodyBytes);
        final json = jsonDecode(body) as Map<String, dynamic>;
        return CurrentWeather.fromJson(json);
      } else{
        return null;
      }
    }
    catch(e){
        print(e);
        return null;
    }
  }

}
