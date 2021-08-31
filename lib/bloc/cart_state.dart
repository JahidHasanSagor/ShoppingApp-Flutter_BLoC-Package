import 'package:shopping_app/model/cartItem.dart';

class CartState {
  CartState init() {
    return CartState();
  }

  CartState clone() {
    return CartState();
  }
}

class CartLoading extends CartState{}
class CartOperationSuccess extends CartState{
  final List<CartItem> cartItems;

  CartOperationSuccess(this.cartItems);

}

