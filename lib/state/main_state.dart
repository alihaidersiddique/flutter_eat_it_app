import 'package:flutter_eat_it_app/model/restaurant_model.dart';
import 'package:get/get.dart';

class MainStateController extends GetxController {
  var selectedRestaurant = RestaurantModel(
          address: 'address',
          name: 'name',
          imageUrl: 'imageUrl',
          paymentUrl: 'paymentUrl',
          phone: 'phone')
      .obs;
}
