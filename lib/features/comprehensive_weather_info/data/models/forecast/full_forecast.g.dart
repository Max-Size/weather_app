// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullForecastModel _$FullForecastModelFromJson(Map<String, dynamic> json) =>
    FullForecastModel(
      current: json['current'] == null
          ? null
          : CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForecastModel.fromJson(json['forecast'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullForecastModelToJson(FullForecastModel instance) =>
    <String, dynamic>{
      'location': (instance.location! as LocationModel).toJson(),
      'current': (instance.current! as LocationModel).toJson(),
      'forecast': (instance.forecast! as LocationModel).toJson(),
    };
