import 'package:flutter_eat_it_app/model/food_model.dart';
import 'package:get/get.dart';

class FoodListStateController extends GetxController {
  var selectedFood = FoodModel(
    id: 'id',
    name: 'name',
    price: 0,
    description: 'description',
    image: 'image',
    size: [],
    addon: [],
  ).obs;
}
