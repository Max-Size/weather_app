import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/location.dart';

class CurrentWeather{
  CurrentWeather({ required this.location,required this.current});

  Location? location;
  Current? current;
}
