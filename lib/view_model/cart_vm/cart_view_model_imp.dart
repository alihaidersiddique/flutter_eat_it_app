import 'package:flutter_eat_it_app/state/cart_state.dart';
import 'package:flutter_eat_it_app/view_model/cart_vm/cart_view_model.dart';

class CartViewModelImp implements CartViewModel {
  @override
  void updateCart(CartStateController controller, int index, int value) {
    controller.cart[index].quantity = value;
    controller.cart.refresh();
    controller.saveDatabase();
  }

  @override
  void deleteCart(CartStateController controller, int index) {
    controller.cart.removeAt(index);
    controller.saveDatabase();
  }

  @override
  void clearCart(CartStateController controller) {
    controller.clearCart();
  }
}
