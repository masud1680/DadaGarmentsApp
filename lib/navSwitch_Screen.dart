import 'package:dadaborkahouse/cart_screen.dart';
import 'package:dadaborkahouse/categories_screen.dart';
import 'package:dadaborkahouse/discount_screen.dart';
import 'package:dadaborkahouse/home_screen.dart';
import 'package:dadaborkahouse/product_details.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class NavSwitchScreen extends StatefulWidget {
  const NavSwitchScreen({super.key});

  @override
  State<NavSwitchScreen> createState() => _NavSwitchScreenState();
}

class _NavSwitchScreenState extends State<NavSwitchScreen> {
  // State variable to hold the selected index
  int _pageIndex = 0;



  final _navIconList = <Widget>[
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image(image: AssetImage("assets/home_icon.png")),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image(image: AssetImage("assets/category_icon.png")),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image(image: AssetImage("assets/search_icon.png")),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image(image: AssetImage("assets/cart_icon.png")),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image(image: AssetImage("assets/whitelist_icon.png")),
    ),
  ];

  List screen = [HomeScreen(),CategoriesScreen(),DiscountScreen(), CartScreen(), ProductDetails()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_pageIndex],
      // 2. This is your CurvedNavigationBar
      bottomNavigationBar: Stack(
        children: [
          CurvedNavigationBar(
            // Add your 5 icons to the 'items' list
            items: _navIconList,


            // This is the background color of the PAGE
            backgroundColor: Colors.white,

            // This is the background color of the NAVIGATION BAR itself
            color: Color(0xFFFCE9D8),
            buttonBackgroundColor: Color(0xFFFCE9D8),

            // Optional: Set animation curve and duration
            animationDuration: Duration(milliseconds: 300),

            // 3. This is how you handle the tap
            onTap: (index) {
              // The 'index' will be 0, 1, 2, 3, or 4

              print(index);
              setState(() {
                _pageIndex = index;
              });
            },
          ),
          //home
          Positioned(
              bottom:4,
              left: 16,
              child: Text(
                "Home",

                style: _pageIndex == 0 ? TextStyle(
                    color: Color(0xFF2E2827),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ) : TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),
              )
          ),
          //Category
          Positioned(
              bottom:4,
              left: 75,
              child: Text(
                "Category",
                style: _pageIndex == 1 ? TextStyle(
                    color: Color(0xFF2E2827),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ) : TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),
              )
          ),
          //Search
          Positioned(
              bottom:4,
              left: 160,
              child: Text(
                "Search",
                style: _pageIndex == 2 ? TextStyle(
                    color: Color(0xFF2E2827),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ) : TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),
              )
          ),
          //Cart
          Positioned(
              bottom:4,
              right: 95,
              child: Text(
                "Cart",
                style: _pageIndex == 3 ? TextStyle(
                    color: Color(0xFF2E2827),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ) : TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),
              )
          ),
          //Wishlist
          Positioned(
              bottom:4,
              right: 16,
              child: Text(
                "Wishlist",
                style: _pageIndex == 4 ? TextStyle(
                    color: Color(0xFF2E2827),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ) : TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),
              )
          ),

        ],
      ),

    );
  }
}
