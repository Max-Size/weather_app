abstract class FavoriteCitiesRepository{

  List<String>? getCitiesId();
  
  Future<void> addCityById(String id);

  Future<void> removeCityById(String id);

}
