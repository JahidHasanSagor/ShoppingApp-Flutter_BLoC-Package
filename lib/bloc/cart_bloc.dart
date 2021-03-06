import 'package:bloc/bloc.dart';
import 'package:shopping_app/model/cartItem.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState().init());

  List<CartItem> _cartItem = List.unmodifiable([]);

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
    else if (event is AddToCart) {
      List<CartItem> tempList = List<CartItem>.from(_cartItem);
      bool exits = false;
      int index;
      for (var i = 0; i < _cartItem.length; i++) {
        if (event.product.name == _cartItem[i].product.name) {
          exits = true;
          index = i;
          break;
        }
      }
      if (exits) {
        tempList[index] = CartItem(
          product: event.product,
          quantity: tempList[index].quantity + 1,
        );
      }
      else {
        tempList.add(CartItem(
          quantity: 1,
          product: event.product,
        ),);
      }

      _cartItem = List.unmodifiable(tempList);
      yield CartOperationSuccess(_cartItem);
    }
    else if (event is RemoveFromCart) {
      List<CartItem> tempList = List<CartItem>.from(_cartItem);
      int index;
      for (var i = 0; i < _cartItem.length; i++) {
        if (event.product.name == _cartItem[i].product.name) {
          index = i;
          break;
        }
      }
      if (index != null) {
        if (tempList[index].quantity == 1) {
          tempList.removeAt(index);
        }
        else{
          tempList[index] = CartItem(
            product: event.product,
            quantity: tempList[index].quantity - 1,
          );
        }
      }
      _cartItem = List.unmodifiable(tempList);
      yield CartOperationSuccess(_cartItem);
    }
  }

  Future<CartState> init() async {
    return state.clone();
  }
}