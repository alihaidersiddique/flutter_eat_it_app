import 'package:flutter_eat_it_app/model/category_model.dart';

abstract class CategoryViewModel {
  Future<List<CategoryModel>> displayCategoryByRestaurantId(
      String restaurantId);
}
