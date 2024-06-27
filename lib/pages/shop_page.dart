import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:coffee_shop_app/models/coffee_with_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop_app/pages/selection_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
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
                      CoffeeWithSize coffeeWithSize = CoffeeWithSize(
                        name: eachCoffee.name,
                        price: eachCoffee.price,
                        imagePath: eachCoffee.imagePath,
                        size:
                            'S/M/L', // Default size, you can change it as needed
                      );
                      // Return the tile for this coffee
                      return CoffeeTile(
                        coffee: coffeeWithSize,
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectionPage(
                                  coffee: coffeeWithSize, // Modify this line
                                ),
                              ));
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
