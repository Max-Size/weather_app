import 'package:flutter/material.dart';
import 'package:weather_app/config/routes.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/cities_grid_view.dart';

class FavouriteCitiesList extends StatelessWidget {
  const FavouriteCitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Center(child: Text('Избранное')),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRouteNames.citySearch),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(244, 249, 255, 1),
      body: const CitesGridView(),
    );
  }
}
