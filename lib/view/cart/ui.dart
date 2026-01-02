import 'dart:developer';

import 'package:dadaborkahouse/controller/cart.dart';
import 'package:dadaborkahouse/view/Checkout/ui.dart';
import 'package:dadaborkahouse/view/widgets/single_product_cart_long.dart';
import 'package:flutter/material.dart';

import '../widgets/long_button.dart';

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
                        return SingleProductCart(product: cartData[index], fetchData:   fetchData, countUpdateBtnShow: true,);
                      },
                    ),


                    // Checkout Button
                    InkWell(
                      onTap: () {
                        // print("Bye Now clicked...");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(),)).then((value) => fetchData(),);
                      },
                      child: LongButton(btnName: 'Bye Now',),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}


