import 'package:weather_app/core/constants/constans.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/local/favorite_cities_cache_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/favorite_cities_repository.dart';

class FavoriteCitiesRepositoryImpl implements FavoriteCitiesRepository {
  final FavoriteCitiesCacheService _favoriteCitiesCacheService;

  FavoriteCitiesRepositoryImpl(this._favoriteCitiesCacheService);

  @override
  Future<void> addCityById(String id) async {
    final prefs = await _favoriteCitiesCacheService.prefs;
    final list = await getCitiesId() ?? <String>[];
    list.add(id);
    await prefs.setStringList(
      favoriteCitesKey,
      list,
    );
  }

  @override
  Future<List<String>?> getCitiesId() async {
    final prefs = await _favoriteCitiesCacheService.prefs;
    final list = prefs.getStringList(favoriteCitesKey);
    return list;
  }

  @override
  Future<void> removeCityById(String id) async {
    final prefs = await _favoriteCitiesCacheService.prefs;
    final list = await getCitiesId();
    list?.remove(id);
    await prefs.setStringList(
      favoriteCitesKey,
      list ?? [],
    );
  }
}
