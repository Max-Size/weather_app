import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/core/constants/constans.dart';

class WeatherApiService {
  Future<Response> getCurrentWeather({
    required String language,
    required String city,
    required String apiKey,
  }) async {
    final queryParameters = <String, dynamic>{
      'key': apiKey,
      'q': city,
      'lang': language,
    };
    final url = Uri.http(
      apiHost,
      apiGetCurrentWeatherPath,
      queryParameters,
    );
    final response = await http.get(url);
    return response;
  }

  Future<Response> getForecast({
    required String language,
    required String city,
    required String apiKey,
    String days = '3',
  }) async{
    final queryParameters = <String, dynamic>{
      'key': apiKey,
      'q': city,
      'days' : days,
      'lang': language,
    };

    final url = Uri.http(
      apiHost,
      apiGetForecastPath,
      queryParameters,
    );

    final response = await http.get(url);
    return response;
  }
}
