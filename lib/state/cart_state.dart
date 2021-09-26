import 'dart:convert';
import 'package:flutter_eat_it_app/model/cart_model.dart';
import 'package:flutter_eat_it_app/model/food_model.dart';
import 'package:flutter_eat_it_app/strings/cart_strings.dart';
import 'package:flutter_eat_it_app/utils/const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartStateController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;
  final box = GetStorage();

  addToCart(FoodModel foodModel, {int quantity = 1}) async {
    try {
      var cartItem = CartModel(
        id: foodModel.id,
        name: foodModel.name,
        price: foodModel.price,
        image: foodModel.image,
        size: foodModel.size,
        addon: foodModel.addon,
        description: foodModel.description,
        quantity: quantity,
      );
      if (isExists(cartItem)) {
        // if cart item already available in cart, and need to update quantity
        var foodNeedToUpdate =
            cart.firstWhere((element) => element.id == cartItem.id);
        foodNeedToUpdate.quantity += quantity;
      } else {
        cart.add(cartItem);
      }
      // after update we will save it to storage
      var jsonDBEncode = jsonEncode(cart);
      await box.write(MY_CART_KEY, jsonDBEncode);
      cart.refresh();
      Get.snackbar(successTitle, successMessage);
    } catch (e) {
      Get.snackbar(errorTitle, e.toString());
    }
  }

  isExists(CartModel cartItem) =>
      cart.any((element) => element.id == cartItem.id);

  sumCart() => cart.length == 0
      ? 0
      : cart
          .map((e) => e.price * e.quantity)
          .reduce((value, element) => value + element);

  getQuantity() => cart.length == 0
      ? 0
      : cart.map((e) => e.quantity).reduce((value, element) => value + element);

  getShippingFee() => sumCart() * 0.1; // 10% of total purchase

  getSubTotal() => sumCart() + getShippingFee();

  clearCart() {
    cart.clear();
    saveDatabase();
  }

  saveDatabase() => box.write(MY_CART_KEY, jsonEncode(cart));
}
