import 'package:flutter_eat_it_app/model/food_model.dart';

class CartModel extends FoodModel {
  int quantity = 0;

  CartModel({
    id,
    name,
    price,
    image,
    size,
    addon,
    description,
    required this.quantity,
  }) : super(
          id: id,
          name: name,
          price: price,
          image: image,
          size: size,
          addon: addon,
          description: description,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final food = FoodModel.fromJson(json);
    final quantity = json['quantity'];
    return CartModel(
      id: food.id,
      name: food.name,
      price: food.price,
      image: food.image,
      size: food.size,
      addon: food.addon,
      description: food.description,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['size'] = this.size.map((v) => v.toJson()).toList();
    data['addon'] = this.addon.map((v) => v.toJson()).toList();
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    return data;
  }
}
