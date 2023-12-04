import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/location.dart';

part 'location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationModel extends Location{

  LocationModel({
    super.name,
    super.region,
    super.country,
    super.lat,
    super.lon,
    super.tzId,
    super.localtimeEpoch,
    super.localtime,
  });

  factory LocationModel.fromJson(Map<String,dynamic> json) =>
   _$LocationFromJson(json);

  Map<String,dynamic> toJson() => _$LocationModelToJson(this);
}
