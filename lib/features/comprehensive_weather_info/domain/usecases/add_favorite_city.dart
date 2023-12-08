import 'package:weather_app/features/comprehensive_weather_info/domain/repository/favorite_cities_repository.dart';

class AddFavoriteCityUseCase{

  final FavoriteCitiesRepository _favoriteCitiesRepository;

  AddFavoriteCityUseCase(this._favoriteCitiesRepository);

  Future<void> call(String id) async{
    await _favoriteCitiesRepository.addCityById(id);
  }

}
