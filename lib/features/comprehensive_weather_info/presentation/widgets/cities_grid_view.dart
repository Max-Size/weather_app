import 'package:flutter/material.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/grid_view_item.dart';

class CitesGridView extends StatelessWidget {
  const CitesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 16, // Spacing between rows
          crossAxisSpacing: 16, // Spacing between columns
        ),
        itemBuilder: (BuildContext context, int index) {
          return const GridViewItem();
        },
        itemCount: 5,
      ),
    );
  }
}
