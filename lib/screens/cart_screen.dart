import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/cart_state.dart';
import 'package:flutter_eat_it_app/strings/cart_strings.dart';
import 'package:flutter_eat_it_app/widget/cart/cart_image_widget.dart';
import 'package:flutter_eat_it_app/widget/cart/cart_info_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
          ? Obx(() => Column(children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: cartStateController.cart.length,
                  itemBuilder: (context, index) => Slidable(
                    child: Card(
                      elevation: 8.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CartImageWidget(
                                cartStateController: cartStateController,
                                cartModel: cartStateController.cart[index],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: CartInfoWidget(
                                cartModel: cartStateController.cart[index],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: [
                      IconSlideAction(
                        caption: deleteText,
                        icon: Icons.delete,
                        color: Colors.red,
                        onTap: () {},
                      )
                    ],
                  ),
                ))
              ]))
          : Center(
              child: Text(cartEmptyText),
            ),
    );
  }
}
