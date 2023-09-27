import 'package:coffee_shop/models/coffee_page.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<CoffeePage> _shop = [
    // black coffee
    CoffeePage(
      name: 'Long Black',
      price: "10 SAR",
      imagePath: "lib/images/hot-coffee-3.png",
    ),

    // latte
    CoffeePage(
      name: 'Latte',
      price: "20 SAR",
      imagePath: "lib/images/latte-macchiato.png",
    ),

    // espresso
    CoffeePage(
      name: 'Espresso',
      price: "12 SAR",
      imagePath: "lib/images/hot-coffee-2.png",
    ),

    // iced coffee
    CoffeePage(
      name: 'Iced Coffee',
      price: "24 SAR",
      imagePath: "lib/images/iced-coffee.png",
    ),
  ];

  // user cart
  final List<CoffeePage> _userCart = [];

  // get coffee list
  List<CoffeePage> get coffeeShop => _shop;

  // get user cart
  List<CoffeePage> get UserCart => _userCart;

  // add item to cart
  void addItemToCart(CoffeePage coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(CoffeePage coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
