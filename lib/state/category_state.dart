import 'package:flutter_eat_it_app/model/category_model.dart';
import 'package:get/get.dart';

class CategoryStateController extends GetxController {
  var selectedCategory =
      CategoryModel(name: 'name', image: 'image', foods: []).obs;
}
