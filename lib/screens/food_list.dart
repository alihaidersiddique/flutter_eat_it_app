import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/category_state.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListScreen extends StatelessWidget {
  //final mainView = CategoryViewModelImp();
  final CategoryStateController categoryStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${categoryStateController.selectedCategory.value.name}',
            style: GoogleFonts.jetBrainsMono(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 10,
        ),
        body: Center(
          child: Text(
              'We have ${categoryStateController.selectedCategory.value.foods.length} foods in this category.'),
        ));
  }
}
