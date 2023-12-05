import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromARGB(157, 52, 121, 211),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Row(
              children: [Text('cityName')],
            ),
            Image.network('https://cdn.weatherapi.com/weather/64x64/day/116.png'),
          ],
        ),
      ),
    );
  }
}
