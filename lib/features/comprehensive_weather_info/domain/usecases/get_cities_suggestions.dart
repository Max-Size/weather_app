import 'package:weather_app/features/comprehensive_weather_info/domain/entities/city/city.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/city_suggestions_repository.dart';

class GetCitiesSuggestionsUseCase{

  final CitySuggestionsRepository _citySuggestionsRepository;

  GetCitiesSuggestionsUseCase(this._citySuggestionsRepository);

  Future<List<City>?> call(String cityName){
    return _citySuggestionsRepository.getCitySuggestions(cityName);
  }

}
