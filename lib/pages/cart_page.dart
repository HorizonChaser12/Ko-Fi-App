import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee_with_size.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(CoffeeWithSize coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  void payNow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Payment Complete"),
          content: const Text(
              "Your payment is complete and your order has been placed."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
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
                "Your Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              if (value.userCart.isEmpty)
                Container(
                  width: 400,
                  height: 400,
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your cart is empty for now 😔",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Order now!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    // Get individual Coffee
                    CoffeeWithSize eachCoffee = value.userCart[index];
                    // Return the tile for this coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeFromCart(eachCoffee),
                    );
                  },
                ),
              ),
              // A Pay Button
              GestureDetector(
                onTap: value.userCart.isNotEmpty ? payNow : null,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      color: value.userCart.isNotEmpty
                          ? Colors.brown
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
