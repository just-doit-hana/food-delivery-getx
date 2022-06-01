// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExist,
      this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['id'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    quantity = data['quantity'];
    isExist = data['isExist'];
    time = data['time'];
    return data;
  }
}
