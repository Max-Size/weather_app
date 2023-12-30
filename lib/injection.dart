import 'package:get_it/get_it.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/local/favorite_cities_cache_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/remote/city_autocomplete_api_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/repository/city_suggestions_repository_impl.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/repository/current_weather_repository_impl.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/repository/favorite_cities_repository_impl.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/repository/forecast_repository_impl.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/add_favorite_city.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_cities_suggestions.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_favourite_cities.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_forecast.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/remove_favorite_city.dart';

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

  getIt.registerSingleton<GetFavoriteCitiesUseCase>(
    GetFavoriteCitiesUseCase(
      FavoriteCitiesRepositoryImpl(
        FavoriteCitiesCacheService(),
      ),
    ),
  );

  getIt.registerSingleton<AddFavoriteCityUseCase>(
    AddFavoriteCityUseCase(
      FavoriteCitiesRepositoryImpl(
        FavoriteCitiesCacheService(),
      ),
    ),
  );

  getIt.registerSingleton<RemoveFavoriteCityUseCase>(
    RemoveFavoriteCityUseCase(
      FavoriteCitiesRepositoryImpl(
        FavoriteCitiesCacheService(),
      ),
    ),
  );

  getIt.registerSingleton<GetForecastUsecase>(
    GetForecastUsecase(
      ForecastRepositoryImpl(
        WeatherApiService(),
      ),
    ),
  );
  
}
