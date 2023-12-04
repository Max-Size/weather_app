
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/core/constants/constans.dart';

class WeatherApiService {
  Future<Response> getCurrentWeather({
    required String language,
    String city = 'auto:ip',
    required String apiKey,
  }) async {
    final queryParameters = <String, dynamic>{
      'key': apiKey,
      'q': city,
      'lang': language,
    };
    final url = Uri.http(apiHost, apiGetCurrentWeatherPath, queryParameters);
    final response = await http.get(url);
    return response;
  }
}
