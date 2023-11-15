import 'package:json_annotation/json_annotation.dart';
import 'current.dart';
import 'location.dart';

part 'current_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CurrentWeather {
  Location? location;
  Current? current;

  CurrentWeather({ required this.location,required this.current});

  factory CurrentWeather.fromJson(Map<String,dynamic> json) => _$CurrentWeatherFromJson(json);

  Map<String,dynamic> toJson() => _$CurrentWeatherToJson(this);
}
