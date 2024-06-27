import 'package:coffee_shop_app/components/bottom_nav_bar.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/pages/cart_page.dart';
import 'package:coffee_shop_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool status = false;
  int _selectedIndex = 0;
  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Pages
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.question_mark_rounded,
                    size: 30,
                  ),
                  onPressed: () {},
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: const Text(
                'Hello!',
                style: TextStyle(fontSize: 50),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigationBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
