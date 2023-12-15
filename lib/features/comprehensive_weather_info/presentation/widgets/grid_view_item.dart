import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/entities/current_weather/current_weather.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/favorite_cities_model.dart';

class GridViewItem extends StatelessWidget {
  final CurrentWeather? currentWeather;
  final int index;

  const GridViewItem(this.currentWeather, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    if (currentWeather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromARGB(157, 52, 121, 211),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(currentWeather?.location?.name ?? ''),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () =>
                      context.read<FavoriteCitiesModel>().onDeleteTap(index),
                  icon: const Icon(Icons.delete_outline_rounded),
                ),
              ],
            ),
            Image.network(
              'https:${currentWeather!.current!.condition!.icon!}',
            ),
            Text(currentWeather?.current?.tempC.toString() ?? ''),
          ],
        ),
      ),
    );
  }
}
