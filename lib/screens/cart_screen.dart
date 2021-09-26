import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/state/cart_state.dart';
import 'package:flutter_eat_it_app/strings/cart_strings.dart';
import 'package:flutter_eat_it_app/view_model/cart_vm/cart_view_model_imp.dart';
import 'package:flutter_eat_it_app/widget/cart/cart_image_widget.dart';
import 'package:flutter_eat_it_app/widget/cart/cart_info_widget.dart';
import 'package:flutter_eat_it_app/widget/cart/cart_total_widget.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartDetailScreen extends StatelessWidget {
  final CartStateController controller = Get.find();
  final box = GetStorage();
  final CartViewModelImp cartViewModel = CartViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          controller.getQuantity() > 0
              ? IconButton(
                  onPressed: () => Get.defaultDialog(
                    title: clearCartConfirmTitleText,
                    middleText: clearCartConfirmContentText,
                    textCancel: cancelText,
                    textConfirm: confirmText,
                    onConfirm: () => cartViewModel.clearCart(controller),
                  ),
                  icon: Icon(Icons.clear),
                )
              : Container(),
        ],
      ),
      body: controller.getQuantity() > 0
          ? Obx(() => Column(children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: controller.cart.length,
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
                                cartStateController: controller,
                                cartModel: controller.cart[index],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: CartInfoWidget(
                                cartModel: controller.cart[index],
                              ),
                            ),
                            Center(
                                child: ElegantNumberButton(
                              initialValue: controller.cart[index].quantity,
                              minValue: 1,
                              maxValue: 100,
                              color: Colors.orangeAccent,
                              onChanged: (value) {
                                // update quantity
                                cartViewModel.updateCart(
                                    controller, index, value.toInt());
                              },
                              decimalPlaces: 0,
                            ))
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
                          onTap: () {
                            Get.defaultDialog(
                              title: deleteCartConfirmTitleText,
                              middleText: deleteCartConfirmContentText,
                              textCancel: cancelText,
                              textConfirm: confirmText,
                              onConfirm: () =>
                                  cartViewModel.deleteCart(controller, index),
                            );
                          })
                    ],
                  ),
                )),
                CartTotalWidget(controller: controller)
              ]))
          : Center(
              child: Text(cartEmptyText),
            ),
    );
  }
}
