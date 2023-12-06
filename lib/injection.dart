import 'package:get_it/get_it.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/remote/city_autocomplete_api_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/repository/city_suggestions_repository_impl.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/repository/current_weather_repository_impl.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_cities_suggestions.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_current_weather.dart';

final getIt = GetIt.I;

void initDependencies() {
  getIt.registerSingleton<GetCurrentWeatherUseCase>(
    GetCurrentWeatherUseCase(
      CurrentWeatherRepositoryImpl(
        WeatherApiService(),
      ),
    ),
  );

  getIt.registerSingleton<GetCitiesSuggestionsUseCase>(
    GetCitiesSuggestionsUseCase(
      CitySuggestionsRepositoryImpl(
        CityAutoCompleteApiService(),
      ),
    ),
  );
}
