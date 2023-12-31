import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/favorite_cities_model.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/grid_view_item.dart';

class CitesGridView extends StatelessWidget {
  const CitesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FavoriteCitiesModel>();

    return model.currentWeathersOfFavoriteCities == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (BuildContext context, int index) {
                final currentWeather =
                    model.currentWeathersOfFavoriteCities?[index];
                return GestureDetector(
                  onTap: () => model.onFavoriteCityTap(context, index),
                  child: GridViewItem(currentWeather, index),
                );
              },
              itemCount: model.currentWeathersOfFavoriteCities?.length ?? 0,
            ),
          );
  }
}
