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
      total += (double.parse(_cart[i].sellingPrice.toString()) *
          double.parse(_cart[i].quantity.toString()));
    }
    return total;
  }


  int quantity(String id) {
    for (int i = 0; i < _cart.length; i++) {
      if (_cart[i].sId == id) {
        return _cart[i].quantity;
      }
    }
    return 0;
  }
  void addToCart(CartModel CartModel) {
    _cart.add(CartModel);
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
