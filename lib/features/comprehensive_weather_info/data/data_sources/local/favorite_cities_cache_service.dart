import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCitiesCacheService{

  final Future<SharedPreferences> prefs;

  FavoriteCitiesCacheService (): prefs = SharedPreferences.getInstance();

}
