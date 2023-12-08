import 'package:weather_app/core/constants/constans.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/local/favorite_cities_cache_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/favorite_cities_repository.dart';

class FavoriteCitiesRepositoryImpl implements FavoriteCitiesRepository {
  final FavoriteCitiesCacheService _favoriteCitiesCacheService;

  FavoriteCitiesRepositoryImpl(this._favoriteCitiesCacheService);

  @override
  Future<void> addCityById(String id) async{
    final list = getCitiesId() ?? <String>[];
    list.add(id);
    await _favoriteCitiesCacheService.prefs.setStringList(
      favoriteCitesKey,
      list,
    );
  }

  @override
  List<String>? getCitiesId() {
    final list =
        _favoriteCitiesCacheService.prefs.getStringList(favoriteCitesKey);
    return list;
  }

  @override
  Future<void> removeCityById(String id) async {
    final list = getCitiesId();
    list?.remove(id);
    await _favoriteCitiesCacheService.prefs.setStringList(
      favoriteCitesKey,
      list ?? [],
    );
  }
}
