import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  int? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String,dynamic> json) => _$LocationFromJson(json);
  
}
