import 'package:weather_app/features/comprehensive_weather_info/domain/repository/favorite_cities_repository.dart';

class GetFavoriteCitiesUseCase{

  final FavoriteCitiesRepository _favoriteCitiesRepository;

  GetFavoriteCitiesUseCase(this._favoriteCitiesRepository);

  List<String>? call(){
    return _favoriteCitiesRepository.getCitiesId();
  }

}
