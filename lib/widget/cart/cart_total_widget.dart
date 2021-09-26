import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/cart_state.dart';
import 'package:flutter_eat_it_app/strings/cart_strings.dart';
import 'package:flutter_eat_it_app/utils/utils.dart';
import 'package:flutter_eat_it_app/widget/cart/cart_total_item_widget.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CartStateController controller;

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
              value: currencyFormat.format(controller.sumCart()),
              isSubTotal: false,
            ),
            Divider(thickness: 2),
            TotalItemWidget(
              text: shippingFeeText,
              value: currencyFormat.format(controller.getShippingFee()),
              isSubTotal: false,
            ),
            Divider(thickness: 2),
            TotalItemWidget(
              text: subTotalText,
              value: currencyFormat.format(controller.getSubTotal()),
              isSubTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}
