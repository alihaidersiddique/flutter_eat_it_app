import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/cart_state.dart';
import 'package:flutter_eat_it_app/strings/cart_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartDetailScreen extends StatelessWidget {
  final CartStateController cartStateController = Get.find();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          cartStateController.getQuantity() > 0
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                )
              : Container(),
        ],
      ),
      body: cartStateController.getQuantity() > 0
          ? Container()
          : Center(
              child: Text(cartEmptyText),
            ),
    );
  }
}
