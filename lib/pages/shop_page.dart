import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add coffee to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // Dialog Box to confirm adding the product to cart
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added to the cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        // Get individual Coffee
                        Coffee eachCoffee = value.coffeeShop[index];
                        // Return the tile for this coffee
                        return CoffeeTile(
                          coffee: eachCoffee,
                          icon: const Icon(Icons.add),
                          onPressed: () => addToCart(eachCoffee),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
