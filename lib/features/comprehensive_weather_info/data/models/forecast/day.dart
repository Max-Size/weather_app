import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/current_weather/condition.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/day.dart';

part 'day.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DayModel extends Day {

  DayModel({
    required super.maxtempC,
    required super.mintempC,
    required super.condition,
  });

  factory DayModel.fromJson(Map<String,dynamic> json) =>
   _$DayModelFromJson(json);

  Map<String,dynamic> toJson() => _$DayModelToJson(this);
}
