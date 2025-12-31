import 'dart:developer';

import 'package:dadaborkahouse/controller/cart.dart';
import 'package:dadaborkahouse/view/cart/widget/single_product_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;
  List cartData = [];

  void fetchData() async {
    isLoading = true;
    setState(() {});
    cartData = await CartController().fetchCartProducts();
    log("====$cartData");
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
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

      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    SizedBox(height: 20),

                    // Product carts
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: cartData.length,
                      itemBuilder: (context, index) {
                        //single cards
                        return SingleProductCart(product: cartData[index]);
                      },
                    ),

                    // Order Summary
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE5E5E5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
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
                            decoration: BoxDecoration(color: Color(0xFFD4D4D8)),
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
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
