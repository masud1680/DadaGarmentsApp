import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // State variable to hold the selected index
  int _pageIndex = 1;

  final _navIconList = <Widget>[
    Image(image: AssetImage("assets/home_icon.png")),
    Image(image: AssetImage("assets/category_icon.png")),
    Image(image: AssetImage("assets/search_icon.png")),
    Image(image: AssetImage("assets/cart_icon.png")),
    Image(image: AssetImage("assets/whitelist_icon.png")),

  ];

  // // State variable to hold the selected index
  // int _pageIndex = 0;
  //
  // // This is the background color of your page
  // final Color _pageBackgroundColor = Colors.blueAccent;
  //
  // // This is where you define your 5 icons
  // final _navBarItems = <Widget>[
  //   Icon(Icons.home, size: 30, color: Colors.white),
  //   Icon(Icons.search, size: 30, color: Colors.white),
  //   Icon(Icons.add, size: 30, color: Colors.white), // The middle icon
  //   Icon(Icons.favorite, size: 30, color: Colors.white),
  //   Icon(Icons.person, size: 30, color: Colors.white),
  // ];



  // This is the background color of your page
  final Color _pageBackgroundColor = Colors.transparent;

  // This is where you define your 5 icons
  // final _navBarItems = <Widget>[
  //   Icon(Icons.home, size: 30, color: Color(0xFF757575)),
  //   Icon(Icons.search, size: 30, color: Color(0xFF757575)),
  //   Icon(Icons.add, size: 30, color: Color(0xFF757575)), // The middle icon
  //   Icon(Icons.favorite, size: 30, color: Color(0xFF757575)),
  //   Icon(Icons.person, size: 30, color: Color(0xFF757575)),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFF6F6F6),
            radius: 2,
            child: Image(
              image: AssetImage("assets/mask_group.png"),
              width: 20,
              height: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFF5F5F5),
                  child: Image(image: AssetImage("assets/cart_icon.png")),
                ),
                Positioned(
                  top: 6,
                  right: 3,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFFF4A758),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10,),
            //Search box
            Row(
              children: [
                //input search box
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Icon(Icons.search,color: Color(0xFFB3B3B3),size: 30,),
                      ),
                      hintText: "Search Products",
                      hintStyle: TextStyle(color: Color(0xFFB3B3B3)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFF5F5F5))
                      ),
                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4A758),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 50,
                  width: 50,
                  child: Image(image: AssetImage("assets/search_ditels_icon.png")),
                )
              ],
            ),
SizedBox(height: 20,),
            //Category Card
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.8
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFEFAF5),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE4E4E7),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ],

                      ),
                      height: 100,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Embroidery Abaya",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(
                              "380 Items",
                              style: TextStyle(
                                  color: Color(0xFF9F9FA9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
            )
          ],
        ),





      ),

      // bottom Navigation Bar
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Color(0xFFFCE9D8),
      //   buttonBackgroundColor: Color(0xFFFCE9D8),
      //   items: <Widget>[
      //     Icon(Icons.add, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.compare_arrows, size: 30),
      //
      //   ],
      //   onTap: (index) {
      //     //Handle button tap
      //     setState(() {
      //       _bottomNavIndex = index;
      //     });
      //   },
      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //
      //     });
      //   },
      //   //params
      //   backgroundColor: Colors.red,
      //
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: NavIocnList,
      //   activeIndex: _bottomNavIndex,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.softEdge,
      //   onTap: (index) => setState(() => _bottomNavIndex = index),
      //   //other params
      // ),


      // 2. This is your CurvedNavigationBar
      bottomNavigationBar: CurvedNavigationBar(

        // Add your 5 icons to the 'items' list
        items: _navIconList,

        // This is the background color of the PAGE
        backgroundColor: _pageBackgroundColor,

        // This is the background color of the NAVIGATION BAR itself
        color: Color(0xFFFCE9D8),
        buttonBackgroundColor: Color(0xFFFCE9D8),

        // Optional: Set animation curve and duration
        animationDuration: Duration(milliseconds: 300),

        // 3. This is how you handle the tap
        onTap: (index) {
          // The 'index' will be 0, 1, 2, 3, or 4
          setState(() {
            _pageIndex = index;
          });
        },
      ),

    );
  }
}
