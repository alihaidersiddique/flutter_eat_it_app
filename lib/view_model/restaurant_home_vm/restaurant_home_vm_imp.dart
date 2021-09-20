import 'package:flutter_eat_it_app/firebase/best_deals_reference.dart';
import 'package:flutter_eat_it_app/firebase/popular_reference.dart';
import 'package:flutter_eat_it_app/model/popular_item_model.dart';
import 'package:flutter_eat_it_app/view_model/restaurant_home_vm/restaurant_home_vm.dart';

class RestaurantHomeViewModelImp implements RestaurantHomeViewModel {
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(
      String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealByRestaurantId(
      String restaurantId) {
    return getBestDealByRestaurantId(restaurantId);
  }
}
