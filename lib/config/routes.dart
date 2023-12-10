import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/pages/favourite_cities_list.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/pages/main_screen_widget.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/pages/searching_city.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/main_screen_model.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/searching_city_model.dart';

abstract class AppRouteNames {
  static const main = '/';
  static const favouriteCities = '/favourite_cities';
  static const citySearch = '/favourite_cities/city_search';
}

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteNames.favouriteCities: (context) => const FavouriteCitiesList(),
    AppRouteNames.citySearch: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => SearchingCityModel(),
          child: const SearchingCityScreen(),
        ),
  };

  static Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.main:
        final args = settings.arguments as String?;
        final cityId = args == null ? 'auto:ip' : 'id:$args';
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) =>
                MainScreenModel(city: cityId),
            child: const MainScreen(),
          ),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
