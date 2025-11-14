import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


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
          "Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 20,),
            // Product carts
            Column(
              spacing: 10,
              children: [
                //card 01
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F2ED),
                    boxShadow:[
                      BoxShadow(
                        color: Color(0xFFE5E5E5),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 100,
                  width: double.infinity,
                  // single card details
                  child: Row(
                    children: [
                      // card image
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/cart_product_image02.png"),
                              fit: BoxFit.fill
                            ),
                            borderRadius:BorderRadius.circular(10),

                          ),
                          height: 90,
                          width: 90,
                        ),
                      ),

                      // card product details
                      Expanded(
                        flex: 10,
                        child: Container(
                          // margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Text(
                                "Party Borkha Abaya...",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Size: 35",
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              ),
                              // price
                              Row(
                                spacing: 7,
                                children: [
                                  Text(
                                    "BDT 2880",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    "BDT 3200",
                                    style: TextStyle(
                                        color: Color(0xFFB3B3B3),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // items count increament & decriment button
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(0xFFFBE9D7),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          width: 30,
                          height: double.infinity,
                          
                          
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFFF4A758),
                                  radius: 12,
                                  child: Icon(Icons.add,color: Colors.black,),
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Color(0xFFF4A758),
                                  radius: 12,
                                  child: Icon(Icons.remove, color: Colors.black,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //card 02
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F2ED),
                      boxShadow:[
                        BoxShadow(
                          color: Color(0xFFE5E5E5),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 100,
                  width: double.infinity,
                  // single card details
                  child: Row(
                    children: [
                      // card image
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/cart_product_image01.png"),
                                fit: BoxFit.fill
                            ),
                            borderRadius:BorderRadius.circular(10),

                          ),
                          height: 90,
                          width: 90,
                        ),
                      ),

                      // card product details
                      Expanded(
                        flex: 10,
                        child: Container(
                          // margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Text(
                                "Party Borkha Abaya...",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Size: 35",
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              ),
                              // price
                              Row(
                                spacing: 7,
                                children: [
                                  Text(
                                    "BDT 2880",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    "BDT 3200",
                                    style: TextStyle(
                                      color: Color(0xFFB3B3B3),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // items count increament & decriment button
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(0xFFFBE9D7),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          width: 30,
                          height: double.infinity,


                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFFF4A758),
                                  radius: 12,
                                  child: Icon(Icons.add,color: Colors.black,),
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Color(0xFFF4A758),
                                  radius: 12,
                                  child: Icon(Icons.remove, color: Colors.black,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // Order Summary
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE5E5E5),
                      spreadRadius: 1,
                      blurRadius: 1
                    )
                  ]
                ),
                width: double.infinity,
                height: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    // total price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "9420",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    // Shipping cost
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Cost",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "80",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    // Delivery Location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Location",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Inside Dhaka",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD4D4D8),
                      ),
                      height: 1,
                      width: double.infinity,
                    ),
                    // overall Total price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "9500",
                          style: TextStyle(
                            color: Color(0xFF9F9FA9),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            // Checkout Button
            InkWell(
              onTap: () {
                print("Checkout clicked...");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF4A758),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD4D4D4),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),



    );
  }
}
