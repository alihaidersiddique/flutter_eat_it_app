import 'package:flutter_eat_it_app/model/restaurant_model.dart';

abstract class MainViewModel {
  Future<List<RestaurantModel>> displayRestaurantList();
}
