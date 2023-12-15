import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/condition.dart';

class Day{
  double? maxtempC;
  double? mintempC;
  Condition? condition;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.condition,
  });
}
