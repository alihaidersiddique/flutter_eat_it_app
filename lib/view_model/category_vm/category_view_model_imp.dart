import 'package:flutter_eat_it_app/firebase/category_reference.dart';
import 'package:flutter_eat_it_app/model/category_model.dart';
import 'package:flutter_eat_it_app/view_model/category_vm/category_view_model.dart';

class CategoryViewModelImp implements CategoryViewModel {
  @override
  Future<List<CategoryModel>> displayCategoryByRestaurantId(
      String restaurantId) {
    return getCategoryByRestaurantId(restaurantId);
  }
}
