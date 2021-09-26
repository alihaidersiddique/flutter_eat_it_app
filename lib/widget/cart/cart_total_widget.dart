import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/cart_state.dart';
import 'package:flutter_eat_it_app/state/main_state.dart';
import 'package:flutter_eat_it_app/strings/cart_strings.dart';
import 'package:flutter_eat_it_app/utils/utils.dart';
import 'package:flutter_eat_it_app/widget/cart/cart_total_item_widget.dart';
import 'package:get/get.dart';

class CartTotalWidget extends StatelessWidget {
  CartTotalWidget({
    Key? key,
    required this.cartStateController,
  }) : super(key: key);

  final CartStateController cartStateController;
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TotalItemWidget(
              text: totalText,
              value: currencyFormat.format(cartStateController.sumCart(
                  mainStateController.selectedRestaurant.value.restaurantId)),
              isSubTotal: false,
            ),
            Divider(thickness: 2),
            TotalItemWidget(
              text: shippingFeeText,
              value: currencyFormat.format(cartStateController.getShippingFee(
                  mainStateController.selectedRestaurant.value.restaurantId)),
              isSubTotal: false,
            ),
            Divider(thickness: 2),
            TotalItemWidget(
              text: subTotalText,
              value: currencyFormat.format(cartStateController.getSubTotal(
                  mainStateController.selectedRestaurant.value.restaurantId)),
              isSubTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}
