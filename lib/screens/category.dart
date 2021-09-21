import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/model/category_model.dart';
import 'package:flutter_eat_it_app/state/category_state.dart';
import 'package:flutter_eat_it_app/state/main_state.dart';
import 'package:flutter_eat_it_app/strings/restaurant_home_strings.dart';
import 'package:flutter_eat_it_app/view_model/category_vm/category_view_model_imp.dart';
import 'package:flutter_eat_it_app/widget/category/category_list_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  final mainView = CategoryViewModelImp();
  final MainStateController mainStateController = Get.find();
  final CategoryStateController categoryStateController =
      Get.put(CategoryStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryText,
          style: GoogleFonts.jetBrainsMono(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 10,
      ),
      body: FutureBuilder(
        future: mainView.displayCategoryByRestaurantId(
            mainStateController.selectedRestaurant.value.restaurantId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var lst = snapshot.data as List<CategoryModel>;
            return Container(
                margin: const EdgeInsets.only(top: 10),
                child: CategoryListWidget(
                  lst: lst,
                  categoryStateController: categoryStateController,
                ));
          }
        },
      ),
    );
  }
}
