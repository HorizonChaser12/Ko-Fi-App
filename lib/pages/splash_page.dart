import 'package:coffee_shop_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Hello! Welcome to the Ko-Fi Shop <3",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown[500]),
          ),
          Container(
            child: Lottie.asset('assets/Coffee1.json'),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  pageBuilder: (_, __, ___) => const HomePage(),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0.5, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeIn,
                          ),
                        ),
                        child: child,
                      ),
                    );
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text(
                  "Brew your Coffee",
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
    );
  }
}
