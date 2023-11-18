import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/current_weather/current.dart';
import 'package:weather_app/data/models/current_weather/location.dart';
import 'package:weather_app/domain/entities/current_weather/current_weather.dart';

part 'current_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CurrentWeatherModel extends CurrentWeather{

  CurrentWeatherModel({ required super.location,required super.current});

  factory CurrentWeatherModel.fromJson(Map<String,dynamic> json) =>
   _$CurrentWeatherModelFromJson(json);

  Map<String,dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}
