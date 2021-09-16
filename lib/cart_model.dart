import 'package:flutter/foundation.dart';

class CartModel{
  String name;
  String image;
  bool isClick;
  String weight;
  int quantity;
  int mrp;
 String sId;
  int sellingPrice;
  CartModel({
    this.weight,
    this.isClick=false,
    this.image,
    this.name,
    this.quantity,
    this.sellingPrice,
    this.mrp
});
}

