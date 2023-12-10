import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/favorite_cities_model.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/city_suggestions_widget.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/searching_text_field.dart';

class SearchingCityScreen extends StatelessWidget {
  const SearchingCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Center(child: Text('Поиск')),
      ),
      body: const Stack(
        children: [
          CitySuggestionsListWidget(),
          SearchingTextFieldWidget(),
        ],
      ),
    );
  }
}
