import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/day.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/hour.dart';

class ForecastDay{
  String? date;
  Day? day;
  List<Hour>? hour;

  ForecastDay({required this.date, required this.day, required this.hour});

}
