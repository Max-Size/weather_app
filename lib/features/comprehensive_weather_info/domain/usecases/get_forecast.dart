import 'package:weather_app/features/comprehensive_weather_info/domain/entities/forecast/full_forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/forecast_repository.dart';

class GetForecastUsecase{

  final FullForecastRepository _forecastRepository;

  GetForecastUsecase(this._forecastRepository);

  Future<FullForecast?> call(String city){
    return _forecastRepository.getForecast(city);
  }

}
