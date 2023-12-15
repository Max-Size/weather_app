import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/location.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/forecast.dart';

class FullForecast {
  Location? location;
  Current? current;
  Forecast? forecast;

  FullForecast({
    required this.current,
    required this.forecast,
    required this.location,
  });
}
