import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/current_weather/current.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/current_weather/location.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/forecast/forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/full_forecast.dart';

part 'full_forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FullForecastModel extends FullForecast {
  
  FullForecastModel({
    required super.current,
    required super.forecast,
    required super.location,
  });

  factory FullForecastModel.fromJson(Map<String,dynamic> json) =>
   _$FullForecastModelFromJson(json);

  Map<String,dynamic> toJson() => _$FullForecastModelToJson(this);

}
