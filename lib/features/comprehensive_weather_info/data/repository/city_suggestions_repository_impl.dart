import 'dart:convert';

import 'package:weather_app/core/constants/constans.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/data_sources/remote/city_autocomplete_api_service.dart';
import 'package:weather_app/features/comprehensive_weather_info/data/models/city/city.dart';
import 'package:weather_app/features/comprehensive_weather_info/domain/repository/city_suggestions_repository.dart';

class CitySuggestionsRepositoryImpl implements CitySuggestionsRepository {
  final CityAutoCompleteApiService _cityAutoCompleteApiService;

  CitySuggestionsRepositoryImpl(this._cityAutoCompleteApiService);

  @override
  Future<List<CityModel>?> getCitySuggestions(String cityName) async {
    try {
      final httpResponse = await _cityAutoCompleteApiService.getCitySuggestions(
        cityName: cityName,
        language: 'ru',
        apiKey: apiKey,
      );
      if (httpResponse.statusCode == 200) {
        final body = utf8.decode(httpResponse.bodyBytes);
        final json = jsonDecode(body) as List<dynamic>;
        final cities = json
            .map(
              (e) => CityModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return cities;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
