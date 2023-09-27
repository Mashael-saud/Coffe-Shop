import 'package:coffee_shop/components/coffee_tile_page.dart';
import 'package:coffee_shop/models/coffee_page.dart';
import 'package:coffee_shop/models/coffee_shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove items From Cart
  void removeFromCart(CoffeePage coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  // pay bottom
  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: value.UserCart.length,
                    itemBuilder: (context, index) {
                      CoffeePage eachCoffee = value.UserCart[index];
                      return CoffeeTile(
                        Coffee: eachCoffee,
                        onPressed: () => removeFromCart(eachCoffee),
                        icon: const Icon(Icons.delete),
                      );
                    }),
              ),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Pay Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
