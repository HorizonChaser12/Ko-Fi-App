import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_with_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';

class SelectionPage extends StatefulWidget {
  final Coffee coffee;

  const SelectionPage({super.key, required this.coffee});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int counter = 1;
  String selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    // Add coffee to cart
    void addToCart(int amount) {
      CoffeeWithSize coffeeWithSize = CoffeeWithSize(
        name: widget.coffee.name,
        price: widget.coffee.price,
        imagePath: widget.coffee.imagePath,
        size: selectedSize,
      );

      Provider.of<CoffeeShop>(context, listen: false)
          .addItemToCart(coffeeWithSize, amount);

      // Dialog Box to confirm adding the product to cart
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Successfully added to the cart"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey.shade300),
      body: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.coffee.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                LottieBuilder.asset(widget.coffee.imagePath),
                Text(
                  "Price: \$${widget.coffee.price.toString()}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      iconSize: 40,
                      onPressed: () {
                        setState(() {
                          if (counter > 1) counter--;
                        });
                      },
                    ),
                    Text(
                      '$counter',
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      iconSize: 40,
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "S I Z E",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = 'S';
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectedSize == 'S'
                              ? Colors.brown
                              : Colors.brown.shade200,
                          shape: BoxShape.rectangle,
                        ),
                        child: const Center(
                          child: Text(
                            "S",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = 'M';
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectedSize == 'M'
                              ? Colors.brown
                              : Colors.brown.shade200,
                          shape: BoxShape.rectangle,
                        ),
                        child: const Center(
                          child: Text(
                            "M",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = 'L';
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectedSize == 'L'
                              ? Colors.brown
                              : Colors.brown.shade200,
                          shape: BoxShape.rectangle,
                        ),
                        child: const Center(
                          child: Text(
                            "L",
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
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => addToCart(counter),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        "Add to cart",
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
      ),
    );
  }
}
