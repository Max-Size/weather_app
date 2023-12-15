import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/condition.dart';

class Hour{
  String? time;
  double? tempC;
  Condition? condition;

  Hour({required this.time, required this.tempC, required this.condition});

}
