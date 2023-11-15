import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/current_weather/current.dart';
import 'package:weather_app/domain/entities/current_weather/location.dart';

part 'current_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CurrentWeather {

  CurrentWeather({ required this.location,required this.current});

  factory CurrentWeather.fromJson(Map<String,dynamic> json) =>
   _$CurrentWeatherFromJson(json);
  Location? location;
  Current? current;

  Map<String,dynamic> toJson() => _$CurrentWeatherToJson(this);
}
