import 'dart:math';


import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import '../cart/ui.dart';
import '../categories/ui.dart';
import '../home/ui.dart';
import '../product/ui.dart';
import '../product_details/ui.dart';


class NavSwitchScreen extends StatefulWidget {
  const NavSwitchScreen({super.key});

  @override
  State<NavSwitchScreen> createState() => _NavSwitchScreenState();
}

class _NavSwitchScreenState extends State<NavSwitchScreen> {
  // State variable to hold the selected index
  int pageIndex = 0;

  List screen = [HomeScreen(),CategoriesScreen(),ProductsScreen(whichPage: 'Discount',), CartScreen(), ProductDetails(productId: 1,)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[pageIndex],



      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFFFCE9D8),
        items: [
          CurvedNavigationBarItem(
            child: Image(image: AssetImage("assets/home_icon.png")),
            label: 'Home',
            labelStyle: pageIndex == 0 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
          CurvedNavigationBarItem(
            child: Image(image: AssetImage("assets/category_icon.png")),
            label: 'Category',
            labelStyle: pageIndex == 1 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
          CurvedNavigationBarItem(
            child: Image(image: AssetImage("assets/search_icon.png")),
            label: 'Search',
            labelStyle: pageIndex == 2 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
          CurvedNavigationBarItem(
            child: Image(image: AssetImage("assets/cart_icon.png")),
            label: 'Cart',
            labelStyle: pageIndex == 3 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
          CurvedNavigationBarItem(
            child: Image(image: AssetImage("assets/whitelist_icon.png")),
            label: 'Wishlist',
            labelStyle: pageIndex == 4 ? TextStyle(
                color: Color(0xFF2E2827),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ) : TextStyle(
                color: Color(0xFF757575),
                fontSize: 13,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
        onTap: (index) {
          // Handle button tap
          pageIndex = index;
          setState(() {

          });

        },
      ),



    );
  }
}
