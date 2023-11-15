import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Condition {

  Condition({required this.text,required this.icon,required this.code});

  factory Condition.fromJson(Map<String,dynamic> json) => 
  _$ConditionFromJson(json);
  
  String? text;
  String? icon;
  int? code;

  Map<String,dynamic> toJson() => _$ConditionToJson(this);


}
