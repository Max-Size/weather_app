abstract class FavoriteCitiesRepository{

  Future<List<String>?> getCitiesId();
  
  Future<void> addCityById(String id);

  Future<void> removeCityById(String id);

}
