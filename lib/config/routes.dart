import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/pages/favourite_cities_list.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/pages/main_screen_widget.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/pages/searching_city.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/main_screen_model.dart';

abstract class AppRouteNames {
  static const main = '/';
  static const favouriteCities = '/favourite_cities';
  static const citySearch = '/favourite_cities/city_search';
}

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteNames.main: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => 
          MainScreenModel(city: 'Nizhniy Novgorod'),
          child: const MainScreen(),
        ),
    AppRouteNames.favouriteCities: (context) => const FavouriteCitiesList(),
    AppRouteNames.citySearch: (context) => const SearchingCityScreen(),
  };
}
