import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/config/routes.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/add_favorite_city.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/get_favourite_cities.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/usecases/remove_favorite_city.dart';

class FavoriteCitiesModel extends ChangeNotifier {
  List<String>? _favoriteCitiesID;
  List<CurrentWeather?>? currentWeathersOfFavoriteCities;
  
  final GetFavoriteCitiesUseCase _getFavoriteCitiesUseCase;
  final AddFavoriteCityUseCase _addFavoriteCityUseCase;
  final RemoveFavoriteCityUseCase _removeFavoriteCityUseCase;
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  FavoriteCitiesModel()
      : _getFavoriteCitiesUseCase = GetIt.I.get<GetFavoriteCitiesUseCase>(),
        _addFavoriteCityUseCase = GetIt.I.get<AddFavoriteCityUseCase>(),
        _removeFavoriteCityUseCase = GetIt.I.get<RemoveFavoriteCityUseCase>(),
        _getCurrentWeatherUseCase = GetIt.I.get<GetCurrentWeatherUseCase>() {
        _getCurrentWeatherOfFavoritCities();
  }

  Future<void> _getFavouriteCities() async {
    _favoriteCitiesID = await _getFavoriteCitiesUseCase();
  }

  Future<void> addToFavoriteCities(BuildContext context, String id) async {
    await _addFavoriteCityUseCase(id);
    unawaited(_getCurrentWeatherOfFavoritCities());
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  void onFavoriteCityTap(BuildContext context, int index) {
    final cityId = _favoriteCitiesID?[index];
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRouteNames.main,
      (route) => false,
      arguments: cityId,
    );
  }

  Future<void> _getCurrentWeatherOfFavoritCities() async {
    await _getFavouriteCities();
    final length = _favoriteCitiesID?.length ?? 0;
    currentWeathersOfFavoriteCities = List.filled(length, null, growable: true);
    for (var i = 0; i < length; i++) {
      currentWeathersOfFavoriteCities![i] = await _getCurrentWeatherUseCase(
        'id:${_favoriteCitiesID![i]}',
      );
    }
    notifyListeners();
  }

  void onDeleteTap(int index){
    unawaited(_removeFavoriteCityUseCase(index));
    currentWeathersOfFavoriteCities?.removeAt(index);
    notifyListeners();
  }

}
