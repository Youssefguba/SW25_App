import 'package:ecommerce_app_sw25/models/category_model.dart';
import 'package:ecommerce_app_sw25/screens/account_screen.dart';
import 'package:ecommerce_app_sw25/screens/cart_screen.dart';
import 'package:ecommerce_app_sw25/screens/offers_screen.dart';
import 'package:ecommerce_app_sw25/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'main_screen.dart';

/// Widgets divided into two types : Stateless / Stateful

/// (1) Create Bottom Navigation ( DONE )
/// (2) Create Screens [ Search, Cart, Offers, Account ] ( DONE )
/// (3) Create navigationIndex --> currentIndex AND onTap AND listOfScreens
/// (4) put the listOfScreens in body by Index.
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int navigationIndex = 0;

  List<Widget> screenList = [
    MainScreen(),    // 0
    SearchScreen(),  // 1
    CartScreen(),    // 2
    OffersScreen(),  // 3
    AccountScreen(), // 4
  ];

  @override
  void initState() {
    print('Fetch Slider Photos !!.');
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Context is Here!');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          // callback function
          setState(() {
            navigationIndex = index;
          }); // anonymous function
        },
        currentIndex: navigationIndex, // 3
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"), // 0
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"), // 1
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"), // 2
          BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: "Offer"), // 3
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"), // 4
        ],
      ),
      body: screenList[navigationIndex],
    );
  }
}


