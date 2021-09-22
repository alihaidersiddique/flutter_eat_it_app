import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/food_list_state.dart';
import 'package:flutter_eat_it_app/utils/utils.dart';

class FoodDetailImageWidget extends StatelessWidget {
  const FoodDetailImageWidget({
    Key? key,
    required this.foodListStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: foodDetailImageAreaSize(context) * 0.9,
          child: CachedNetworkImage(
            imageUrl: foodListStateController.selectedFood.value.image,
            fit: BoxFit.cover,
            errorWidget: (context, url, err) => Center(
              child: Icon(Icons.image),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.8, 1.0),
          heightFactor: 0.5,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 10.0,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 10.0,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
