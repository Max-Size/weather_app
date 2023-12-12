import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';

abstract class CurrentWeatherRepository {
  Future<CurrentWeather?> getCurrentWeather(String city);
}
