import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/food_list_state.dart';
import 'package:flutter_eat_it_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodListStateController foodListStateController = Get.find();

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
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: foodDetailImageAreaSize(context) * 0.9,
                        child: CachedNetworkImage(
                          imageUrl:
                              foodListStateController.selectedFood.value.image,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, err) => Center(
                            child: Icon(Icons.image),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}
