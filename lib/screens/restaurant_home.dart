import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eat_it_app/model/popular_item_model.dart';
import 'package:flutter_eat_it_app/state/main_state.dart';
import 'package:flutter_eat_it_app/view_model/restaurant_home_vm/restaurant_home_vm.dart';
import 'package:flutter_eat_it_app/view_model/restaurant_home_vm/restaurant_home_vm_imp.dart';
import 'package:flutter_eat_it_app/widget/restaurant%20home/most_popular_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantHome extends StatelessWidget {
  final MainStateController mainStateController = Get.find();
  final RestaurantHomeViewModel viewModel = RestaurantHomeViewModelImp();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${mainStateController.selectedRestaurant.value.name}',
            style: GoogleFonts.jetBrainsMono(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 10,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: MostPopularWidget(
                    viewModel: viewModel,
                    mainStateController: mainStateController),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: FutureBuilder(
                    future: viewModel.displayBestDealByRestaurantId(
                        mainStateController
                            .selectedRestaurant.value.restaurantId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        var lstBestDeal =
                            snapshot.data as List<PopularItemModel>;
                        return CarouselSlider(
                          items: lstBestDeal
                              .map(
                                (e) => Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Text('${e.name}'),
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayAnimationDuration: Duration(seconds: 3),
                            autoPlayCurve: Curves.easeIn,
                            height: double.infinity,
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
