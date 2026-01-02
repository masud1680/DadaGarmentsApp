import 'dart:convert';
import 'dart:developer';


import 'package:dadaborkahouse/controller/order.dart';

import 'package:dadaborkahouse/view/Checkout/widget/order_summery.dart';
import 'package:dadaborkahouse/view/Checkout/widget/shipping_information_card.dart';

import 'package:dadaborkahouse/view/widgets/single_product_cart_long.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../widgets/long_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.cartData,

  });

  final List cartData;



  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  Map orderSummery = {};

  void calculateOrderSummery() {
    Map temp = {
      'total_p': 0,
      's_cost': 80,
      'd_location': 'Inside Dhaka',
      'total_d': 0,
    };

    if (widget.cartData.isNotEmpty) {
      for (var data in widget.cartData) {
        temp['total_p'] += data['total'];
      }
      temp['total_d'] =
          temp['s_cost'] + temp['total_p'];
    }

    orderSummery = temp;
    log("====$orderSummery");
    // return orderSummery;
  }

  @override
  void initState() {
    // TODO: implement initState

    calculateOrderSummery();
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

      body: Container(
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
                itemCount: widget.cartData.length,
                itemBuilder: (context, index) {
                  //single cards
                  return SingleProductCart(
                    product: widget.cartData[index],

                    countUpdateBtnShow: false,
                    fetchData: () {},
                  );
                },
              ),

              // Order Summary
              OrderSummary(orderSummary: orderSummery),

              SizedBox(height: 10),
              // Checkout Button
              InkWell(
                onTap: () async {
                  log("Order Now clicked...");

                  FlutterSecureStorage storage = FlutterSecureStorage();
                  var usi = await storage.read(key: 'shippingUserInformation');
                  // log('===========$usi========');
                  Map userShippingInformation = jsonDecode(usi!);
                  // log("==========$userShippingInformation==========");

                  List items = [];

                  for (Map item in widget.cartData) {
                    Map temp = {};
                    temp['product_id'] = item['product_id'];
                    temp['product_name'] = item['title'];
                    temp['price'] = item['price'];
                    temp['quantity'] = item['quantity'];

                    items.add(temp);
                  }

                  Map orderData = {
                    "customer_name": userShippingInformation['customer_name'],
                    "customer_phone": userShippingInformation['customer_phone'],
                    "payment_method": 'cod',
                    "items": items,
                    "address": {
                      "street": userShippingInformation['street'],
                      "upazila": userShippingInformation['upazila'],
                      "district": userShippingInformation['district'],
                    },
                  };

                  log("==========$orderData==========");
                  int statusCode = await OrderController().addOrder(
                    orderData: orderData,
                  );
                  if (statusCode == 200) {
                    EasyLoading.showSuccess('Order submit successful.');
                  } else if (statusCode == 422) {
                    EasyLoading.showError("Unprocessable Content");
                  } else {
                    EasyLoading.showError("$statusCode");
                  }
                  // call bottom sheet bar
                  // inputShippingInformationBottomSheetBar(context, );
                },
                child: LongButton(btnName: 'Order Now'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
