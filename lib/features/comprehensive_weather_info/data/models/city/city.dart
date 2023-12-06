import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/city/city.dart';

part 'city.g.dart';

@JsonSerializable()
class CityModel extends City {
  CityModel({
    required super.country,
    required super.id,
    required super.name,
    required super.region,
  });

  factory CityModel.fromJson(Map<String,dynamic> json) => 
    _$CityModelFromJson(json);

   Map<String,dynamic> toJson() => _$CityModelToJson(this);

}
