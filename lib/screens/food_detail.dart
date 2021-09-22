import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/food_detail_state.dart';
import 'package:flutter_eat_it_app/state/food_list_state.dart';
import 'package:flutter_eat_it_app/utils/utils.dart';
import 'package:flutter_eat_it_app/widget/food_detail/food_detail_description_widget.dart';
import 'package:flutter_eat_it_app/widget/food_detail/food_detail_image_widget.dart';
import 'package:flutter_eat_it_app/widget/food_detail/food_detail_name_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodListStateController foodListStateController = Get.find();
  final FoodDetailStateController foodDetailStateController =
      Get.put(FoodDetailStateController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  '${foodListStateController.selectedFood.value.name}',
                  style: GoogleFonts.jetBrainsMono(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                elevation: 10.0,
                foregroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.black),
                bottom: PreferredSize(
                  preferredSize: Size.square(foodDetailImageAreaSize(context)),
                  child: FoodDetailImageWidget(
                      foodListStateController: foodListStateController),
                ),
              ),
            ];
          },
          body: Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FoodDetailNameWidget(
                    foodDetailStateController: foodDetailStateController,
                    foodListStateController: foodListStateController),
                FoodDetailDescriptionWidget(
                    foodListStateController: foodListStateController)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
