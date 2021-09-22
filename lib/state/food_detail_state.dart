import 'package:flutter_eat_it_app/model/size_model.dart';
import 'package:get/get.dart';

class FoodDetailStateController extends GetxController {
  var quantity = 1.obs;
  var selectedSize = SizeModel(name: 'name', price: 0).obs;
}
