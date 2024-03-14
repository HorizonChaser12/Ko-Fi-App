import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    // Black Coffee
    Coffee(
        name: "Long Black",
        price: "4.10",
        imagePath: "assets/brown-coffee.json"),

    // Latte
    Coffee(
      name: "Latte",
      price: "4.20",
      imagePath: "assets/green-coffee.json",
    ),

    // expresso
    Coffee(
      name: "Expresso",
      price: "5.67",
      imagePath: "assets/red-coffee.json",
    ),

    // Iced coffee
    Coffee(
      name: "Iced Coffee",
      price: "4.28",
      imagePath: "assets/black-coffee.json",
    ),
  ];

  // User Cart
  final List<Coffee> _userCart = [];

  // Get coffee list
  List<Coffee> get coffeeShop => _shop;

  // Get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
