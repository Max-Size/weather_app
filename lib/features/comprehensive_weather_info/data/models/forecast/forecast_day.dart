import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/forecast/day.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/forecast/hour.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/forecast_day.dart';

part 'forecast_day.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ForecastDayModel extends ForecastDay {
  ForecastDayModel({
    required super.date,
    required super.day,
    required super.hour,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayModelToJson(this);
}
