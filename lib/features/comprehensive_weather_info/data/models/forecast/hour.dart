import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/current_weather/condition.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/hour.dart';


part 'hour.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class HourModel extends Hour{

  HourModel({
    required super.time,
    required super.tempC,
    required super.condition,
  });

  factory HourModel.fromJson(Map<String,dynamic> json) =>
   _$HourModelFromJson(json);

  Map<String,dynamic> toJson() => _$HourModelToJson(this);
}
