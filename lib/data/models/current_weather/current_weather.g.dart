// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'current_weather.dart';


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    CurrentWeatherModel(
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'location': (instance.location! as LocationModel).toJson(),
      'current': (instance.current! as CurrentModel).toJson(),
    };
