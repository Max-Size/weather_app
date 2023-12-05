import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';

abstract class CurrentWeatherRepository {
  Future<CurrentWeather?> getCurrentWeather(String city);
}

/*class ApiClient {
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
}*/
