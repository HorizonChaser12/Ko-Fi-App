import 'coffee.dart';

class CoffeeWithSize extends Coffee {
  final String size;

  CoffeeWithSize({
    required String name,
    required String price,
    required String imagePath,
    required this.size,
  }) : super(name: name, price: price, imagePath: imagePath);
}
