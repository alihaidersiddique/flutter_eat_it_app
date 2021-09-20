import 'package:flutter_eat_it_app/model/popular_item_model.dart';

abstract class RestaurantHomeDetailViewModel {
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(
      String restaurantId);

  Future<List<PopularItemModel>> displayBestDealByRestaurantId(
      String restaurantId);
}
