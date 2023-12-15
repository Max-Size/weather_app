import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/forecast/forecast_day.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/forecast.dart';


part 'forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ForecastModel extends Forecast{

  ForecastModel({required super.forecastday});
  
  factory ForecastModel.fromJson(Map<String,dynamic> json) =>
   _$ForecastModelFromJson(json);

  Map<String,dynamic> toJson() => _$ForecastModelToJson(this);

}
