import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Model/product_model.dart';

class CartProvider with ChangeNotifier{
//create praivate value
final List<Product> _cart=[];
//getter method
List<Product> get cart =>_cart;

//setter method

void toggleFavorite(Product product){
  if(_cart.contains(product)){
    for(Product element in _cart){
      element.quantity++;
    }
  } else{
    _cart.add(product);
  }
notifyListeners();
}
  increment (int index)=>_cart[index].quantity++;
  decrement (int index)=>_cart[index].quantity--;
  totalPrice() {
    double myTotal = 0.0; // initial
    for (Product element in _cart) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }
static CartProvider of(
    BuildContext context,{
      bool listen= true
  }){
  return Provider.of<CartProvider>(context,listen:listen);
}

}