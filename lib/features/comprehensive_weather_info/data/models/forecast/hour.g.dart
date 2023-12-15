// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourModel _$HourModelFromJson(Map<String, dynamic> json) => HourModel(
      time: json['time'] as String?,
      tempC: (json['temp_c'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourModelToJson(HourModel instance) => <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.tempC,
      'condition': (instance.condition! as ConditionModel).toJson(),
    };
