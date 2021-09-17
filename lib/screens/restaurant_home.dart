import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eat_it_app/model/popular_item_model.dart';
import 'package:flutter_eat_it_app/state/main_state.dart';
import 'package:flutter_eat_it_app/strings/restaurant_home_strings.dart';
import 'package:flutter_eat_it_app/view_model/restaurant_home_vm/restaurant_home_vm.dart';
import 'package:flutter_eat_it_app/view_model/restaurant_home_vm/restaurant_home_vm_imp.dart';
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
          title: Text('${mainStateController.selectedRestaurant.value.name}'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: FutureBuilder(
                      future: viewModel.displayMostPopularByRestaurantId(
                          mainStateController
                              .selectedRestaurant.value.restaurantId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        else {
                          var lstPopular =
                              snapshot.data as List<PopularItemModel>;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mostPopularText,
                                style: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.black45,
                                ),
                              ),
                              Text('Popular length: ${lstPopular.length}')
                            ],
                          );
                        }
                      },
                    ),
                  )),
              Expanded(flex: 2, child: Container(color: Colors.blue))
            ],
          ),
        ),
      ),
    );
  }
}
