import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/condition.dart';

part 'condition.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ConditionModel extends Condition{

  ConditionModel({required super.text,required super.icon,required super.code});

  factory ConditionModel.fromJson(Map<String,dynamic> json) => 
  _$ConditionModelFromJson(json);

  Map<String,dynamic> toJson() => _$ConditionModelToJson(this);


}
