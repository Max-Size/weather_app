import 'package:weather_app/features/comprehensive_weather_info/domain/entities/city/city.dart';

abstract class CitySuggestionsRepository{

  Future<List<City>?> getCitySuggestions(String cityName);

}
