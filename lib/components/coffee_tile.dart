import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Icon icon;
  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(
          coffee.name,
        ),
        subtitle: Text(coffee.price),
        leading: SizedBox(
          width: 100,
          child: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Lottie.asset(
                coffee.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
