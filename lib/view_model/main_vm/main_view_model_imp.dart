import 'package:flutter_eat_it_app/firebase/restaurant_reference.dart';
import 'package:flutter_eat_it_app/model/restaurant_model.dart';
import 'package:flutter_eat_it_app/view_model/main_vm/main_view_model.dart';

class MainViewModelImp implements MainViewModel {
  @override
  Future<List<RestaurantModel>> displayRestaurantList() {
    return getRestaurantList();
  }
}
