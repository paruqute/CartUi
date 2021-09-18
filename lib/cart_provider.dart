import 'package:flutter/material.dart';
import 'dart:convert';


import 'package:flutter/foundation.dart';



import 'cart_model.dart';

class CartProvider extends ChangeNotifier {

  List<CartModel> _cart = [ ];

  List<CartModel> get items {
    return _cart;
  }

  int get cartLength {
    return _cart.length;
  }

  double get total {
    double total = 0;
    for (int i = 0; i < _cart.length; i++) {
      if(_cart[i].quantity==null){
        _cart[i].quantity=1;
      }else {
        total += (double.parse(_cart[i].sellingPrice.toString()) *
            double.parse(_cart[i].quantity.toString()));
      }
    }
    return total;
  }



  void addToCart(CartModel item) {
    if(_cart.length==0){
      _cart.add(item);
      item.quantity=1;
    }else{
      _cart.add(item);
      item.quantity=1;
    }

    notifyListeners();

  }

  void addQuantity(String id) {
    for (int i = 0; i < _cart.length; i++) {
      if (_cart[i].sId == id) {
        int quantity = int.parse(_cart[i].quantity.toString()) + 1;
        _cart[i].quantity = quantity;
      }
    }
    notifyListeners();

  }

  void reduceQuantity(String id) {
    for (int i = 0; i < _cart.length; i++) {
      if (_cart[i].sId == id) {
        int quantity = int.parse(_cart[i].quantity.toString()) - 1;
        if (quantity == 0) {
          deleteItem(id);
        } else {
          _cart[i].quantity = quantity;
        }
      }
    }
    notifyListeners();

  }

  void deleteItem(String sId) {
    for (int i = 0; i < _cart.length; i++) {
      if (_cart[i].sId == sId) {
        _cart.removeAt(i);
      }
    }

  }
}
