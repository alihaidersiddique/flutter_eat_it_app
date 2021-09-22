import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/food_detail_state.dart';
import 'package:flutter_eat_it_app/state/food_list_state.dart';
import 'package:flutter_eat_it_app/strings/food_detail_strings.dart';
import 'package:flutter_eat_it_app/utils/utils.dart';
import 'package:flutter_eat_it_app/widget/food_detail/food_detail_description_widget.dart';
import 'package:flutter_eat_it_app/widget/food_detail/food_detail_image_widget.dart';
import 'package:flutter_eat_it_app/widget/food_detail/food_detail_name_widget.dart';
import 'package:flutter_eat_it_app/widget/food_detail/food_detail_size_widget.dart';
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
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FoodDetailNameWidget(
                      foodDetailStateController: foodDetailStateController,
                      foodListStateController: foodListStateController),
                  FoodDetailDescriptionWidget(
                      foodListStateController: foodListStateController),
                  FoodDetailSizeWidget(
                      foodListStateController: foodListStateController,
                      foodDetailStateController: foodDetailStateController),
                  Card(
                    elevation: 12,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => ExpansionTile(
                                title: Text(
                                  addonText,
                                  style: GoogleFonts.jetBrainsMono(
                                    color: Colors.blueGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                children: [
                                  Wrap(
                                    children: foodListStateController
                                        .selectedFood.value.addon
                                        .map(
                                      (e) {
                                        print(e.name);
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ChoiceChip(
                                              label: Text(e.name),
                                              selected:
                                                  foodDetailStateController
                                                      .selectedAddon
                                                      .contains(e),
                                              onSelected: (selected) => selected
                                                  ? foodDetailStateController
                                                      .selectedAddon
                                                      .add(e)
                                                  : foodDetailStateController
                                                      .selectedAddon
                                                      .remove(e)),
                                        );
                                      },
                                    ).toList(),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
