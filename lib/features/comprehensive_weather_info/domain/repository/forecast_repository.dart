import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/full_forecast.dart';

abstract class FullForecastRepository {
  Future<FullForecast?> getForecast(String city);
}
