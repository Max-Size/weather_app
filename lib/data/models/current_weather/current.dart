import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/current_weather/condition.dart';
import 'package:weather_app/domain/entities/current_weather/current.dart';
part 'current.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CurrentModel extends Current{

  CurrentModel({
    super.lastUpdatedEpoch,
    super.lastUpdated,
    super.tempC,
    super.tempF,
    super.isDay,
    super.condition,
    super.windMph,
    super.windKph,
    super.windDegree,
    super.windDir,
    super.pressureMb,
    super.pressureIn,
    super.precipMm,
    super.precipIn,
    super.humidity,
    super.cloud,
    super.feelslikeC,
    super.feelslikeF,
    super.visKm,
    super.visMiles,
    super.uv,
    super.gustMph,
    super.gustKph,
  });

  factory CurrentModel.fromJson(Map<String,dynamic> json) => _$CurrentModelFromJson(json);
  
  Map<String,dynamic> toJson() => _$CurrentModelToJson(this);
}
