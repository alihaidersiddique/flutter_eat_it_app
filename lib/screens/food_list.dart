import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/const/const.dart';
import 'package:flutter_eat_it_app/screens/food_detail.dart';
import 'package:flutter_eat_it_app/state/category_state.dart';
import 'package:flutter_eat_it_app/state/food_list_state.dart';
import 'package:flutter_eat_it_app/strings/food_list_strings.dart';
import 'package:flutter_eat_it_app/widget/common/appbar_with_cart_widget.dart';
import 'package:flutter_eat_it_app/widget/common/common_widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListScreen extends StatelessWidget {
  final CategoryStateController categoryStateController = Get.find();
  final FoodListStateController foodListStateController =
      Get.put(FoodListStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithCartButton(
            title: '${categoryStateController.selectedCategory.value.name}'),
        body: Column(
          children: [
            Expanded(
                child: LiveList(
              showItemDuration: Duration(milliseconds: 300),
              showItemInterval: Duration(milliseconds: 300),
              reAnimateOnVisibility: true,
              scrollDirection: Axis.vertical,
              itemCount:
                  categoryStateController.selectedCategory.value.foods.length,
              itemBuilder: animationItemBuilder((index) => InkWell(
                  onTap: () {
                    foodListStateController.selectedFood.value =
                        categoryStateController
                            .selectedCategory.value.foods[index];
                    Get.to(() => FoodDetailScreen());
                  },
                  child: Hero(
                    tag: categoryStateController
                        .selectedCategory.value.foods[index].name,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 6 * 2,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // food image
                            CachedNetworkImage(
                              imageUrl: categoryStateController
                                  .selectedCategory.value.foods[index].image,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, err) => Center(
                                child: Icon(Icons.image),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            // grey text box
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Color(COLOR_OVERLAY),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // name text
                                              Text(
                                                '${categoryStateController.selectedCategory.value.foods[index].name}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              // price text
                                              Text(
                                                '$priceText\$${categoryStateController.selectedCategory.value.foods[index].price}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              // icons row
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(width: 50),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.add_shopping_cart,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))),
            ))
          ],
        ));
  }
}
