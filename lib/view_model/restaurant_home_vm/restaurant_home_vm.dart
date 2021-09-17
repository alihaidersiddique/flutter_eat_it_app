import 'package:flutter_eat_it_app/model/popular_item_model.dart';

abstract class RestaurantHomeViewModel{
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(String restaurantId);
}