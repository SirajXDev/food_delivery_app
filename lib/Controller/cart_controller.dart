import 'package:flutter_application_1/Models/cart_model.dart';
import 'package:flutter_application_1/Repository/cart_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController( {required this.cartRepo});
  Map<int,CartModel> _items={};

  void addItem( product ,int quantity){
    print('lenght of the item is ${_items.length}');
    _items.putIfAbsent(product.id!,(){
      print('adding item to the cart${product.id!}quantity$quantity');
      return CartModel(
        id: product.id,
    name: product.name,
    price: product.price,
    img: product.img,
    quantity: quantity,
    isExit:true,
    time: DateTime.now().toString(),
    );});
  
  
  }

}