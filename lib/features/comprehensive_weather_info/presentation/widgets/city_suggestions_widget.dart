import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/favorite_cities_model.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/searching_city_model.dart';

class CitySuggestionsListWidget extends StatelessWidget {
  const CitySuggestionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchingCityModel>();
    return ListView.separated(
      padding: const EdgeInsets.only(top: 100),
      itemBuilder: (context, index) {
        final city = model.citySuggestions?[index];
        return GestureDetector(
          onTap: () => context
              .read<FavoriteCitiesModel>()
              .addToFavoriteCities(context, city?.id.toString() ?? ''),
          child: Text(city?.name ?? ''),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: model.citySuggestions?.length ?? 0,
    );
  }
}
