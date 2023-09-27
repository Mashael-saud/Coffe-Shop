import 'package:coffee_shop/components/coffee_tile_page.dart';
import 'package:coffee_shop/models/coffee_page.dart';
import 'package:coffee_shop/models/coffee_shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(CoffeePage coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // header massages
              const Text(
                'How would you like your coffee?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // list of coffee to buy
              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // get individual coffee
                      CoffeePage eachCoffee = value.coffeeShop[index];

                      // return the tile this coffee
                      return CoffeeTile(
                        Coffee: eachCoffee,
                        icon: const Icon(Icons.add),
                        onPressed: () => addToCart(eachCoffee),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
