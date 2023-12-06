import 'package:http/http.dart';
import 'package:weather_app/core/constants/constans.dart';

class CityAutoCompleteApiService {
  Future<Response> getCitySuggestions({
    required String cityName,
    required String language,
    required String apiKey,
  }) async {
    final queryParameters = {
      'key': apiKey,
      'q': cityName,
      'lang': language,
    };
    final url = Uri.http(
      apiHost,
      searchAutocompletePath,
      queryParameters,
    );
    final response = await get(url);
    return response;
  }
}
