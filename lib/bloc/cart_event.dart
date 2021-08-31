import 'package:shopping_app/model/product.dart';

abstract class CartEvent {}

class InitEvent extends CartEvent {}

class AddToCart extends CartEvent{
  final Product product;
  AddToCart(this.product);
}
class RemoveFromCart extends CartEvent{
  final Product product;
  RemoveFromCart(this.product);
}