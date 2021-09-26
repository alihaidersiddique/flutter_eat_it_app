import 'package:flutter_eat_it_app/screens/category.dart';
import 'package:flutter_eat_it_app/view_model/menu_vm/menu_view_model.dart';
import 'package:get/get.dart';

class MenuViewModelImp implements MenuViewModel {
  @override
  void navigateCategories() {
    Get.to(() => CategoryScreen());
  }

  @override
  void backToRestaurantList() {
    Get.back(closeOverlays: true, canPop: false);
  }
}
