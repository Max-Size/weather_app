import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/favorite_cities_model.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/searching_city_model.dart';

class CitySuggestionsListWidget extends StatelessWidget {
  const CitySuggestionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchingCityModel>();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 100),
        itemBuilder: (context, index) {
          final city = model.citySuggestions?[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () => context
                  .read<FavoriteCitiesModel>()
                  .addToFavoriteCities(context, city?.id.toString() ?? ''),
              child: Text(
                '${city?.name}, ${city?.region}, ${city?.country}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: model.citySuggestions?.length ?? 0,
      ),
    );
  }
}
