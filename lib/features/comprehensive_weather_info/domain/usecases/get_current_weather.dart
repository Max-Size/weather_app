import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/current_weather_repository.dart';

class GetCurrentWeatherUseCase{
  final CurrentWeatherRepository _currentWeatherRepository;

  GetCurrentWeatherUseCase(this._currentWeatherRepository);

  Future<CurrentWeather?> call(){
    return _currentWeatherRepository.getCurrentWeather();
  }
}
