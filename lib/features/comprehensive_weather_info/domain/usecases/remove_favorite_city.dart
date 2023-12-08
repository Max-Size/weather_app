import 'package:weather_app/features/comprehensive_weather_info/domain/repository/favorite_cities_repository.dart';

class RemoveFavoriteCityUseCase{

  final FavoriteCitiesRepository _favoriteCitiesRepository;

  RemoveFavoriteCityUseCase(this._favoriteCitiesRepository);

  Future<void> call(String id) async{
    await _favoriteCitiesRepository.removeCityById(id);
  }

}
