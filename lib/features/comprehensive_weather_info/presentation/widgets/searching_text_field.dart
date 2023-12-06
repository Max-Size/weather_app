import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/searching_city_model.dart';

class SearchingTextFieldWidget extends StatelessWidget {
  const SearchingTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        onChanged: context.read<SearchingCityModel>().updateCitySuggestions,
        decoration: const InputDecoration(
          labelText: 'Поиск',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
