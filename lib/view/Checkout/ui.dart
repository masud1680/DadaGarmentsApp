import 'dart:developer';

import 'package:dadaborkahouse/controller/cart.dart';
import 'package:dadaborkahouse/view/Checkout/widget/order_summery.dart';
import 'package:dadaborkahouse/view/Checkout/widget/shipping_information_card.dart';

import 'package:dadaborkahouse/view/widgets/single_product_cart_long.dart';
import 'package:flutter/material.dart';

import '../widgets/long_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isLoading = false;
  List cartData = [];

  Map orderSummery = {};

  void fetchData() async {
    isLoading = true;
    setState(() {});
    cartData = await CartController().fetchCartProducts();

    isLoading = false;
    orderSummery = calculateOrderSummery();

    setState(() {});
  }

  Map calculateOrderSummery() {
    Map orderSummery = {
      'total_p': 0,
      's_cost': 80,
      'd_location': 'Inside Dhaka',
      'total_d': 0,
    };

    if (cartData.isNotEmpty) {
      for (var data in cartData) {
        orderSummery['total_p'] += data['total'];
      }
      orderSummery['total_d'] = orderSummery['s_cost'] + orderSummery['total_p'];
    }
    // log("====$orderSummery");
return orderSummery;
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
          "Checkout",
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
              margin: EdgeInsets.symmetric(horizontal: 6),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    SizedBox(height: 10),

                    //Shipping Information
                    ShippingInformationCard(),
                    // SizedBox(height: 0),

                    // Product carts
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: cartData.length,
                      itemBuilder: (context, index) {
                        //single cards
                        return SingleProductCart(
                          product: cartData[index],
                          fetchData: fetchData, countUpdateBtnShow: false,
                        );
                      },
                    ),

                    // Order Summary
                    OrderSummary(orderSummary: orderSummery,),
                    SizedBox(height: 10),
                    // Checkout Button
                    InkWell(
                      onTap: () {
                        print("Bye Now clicked...");
                      },
                      child: LongButton(btnName: 'Checkout'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
