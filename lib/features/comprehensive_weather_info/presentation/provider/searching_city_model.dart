import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/city/city.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_cities_suggestions.dart';

class SearchingCityModel extends ChangeNotifier{

  //String typedCityName = '';
  List<City>? citySuggestions;
  final GetCitiesSuggestionsUseCase _getCitiesSuggestionsUseCase;

  SearchingCityModel() : _getCitiesSuggestionsUseCase = 
    GetIt.I.get<GetCitiesSuggestionsUseCase>();

  Future<void> updateCitySuggestions(String str) async{
    citySuggestions = await _getCitiesSuggestionsUseCase(str);
    notifyListeners();
  }

}
