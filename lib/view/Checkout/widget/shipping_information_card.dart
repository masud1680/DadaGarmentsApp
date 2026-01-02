import 'dart:convert';
import 'dart:developer';

import 'package:dadaborkahouse/view/Checkout/shippingData/input_shipping_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'input_shipping_information.dart';

class ShippingInformationCard extends StatefulWidget {
  const ShippingInformationCard({super.key});

  @override
  State<ShippingInformationCard> createState() =>
      _ShippingInformationCardState();
}

class _ShippingInformationCardState extends State<ShippingInformationCard> {
  bool isLoading = false;

  Map userShippingInformation = {};

  void fetchData() async {
    isLoading = true;
    setState(() {});

    FlutterSecureStorage storage = FlutterSecureStorage();
    var sui = await storage.read(key: 'shippingUserInformation');
    if (sui != null) {
      userShippingInformation = jsonDecode(sui);

      // log('=============$userShippingInformation==========');
    }
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),

      width: MediaQuery.sizeOf(context).width,
      height: 200,
  // car title & button
      child: Column(
        spacing: 5,
        children: [
          // title bar
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Information',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //add button name
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      // call bottom sheet bar
                      // inputShippingInformationBottomSheetBar(context, userName , userPhone, userPhone);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              InputShippingData(whichBtn: 'add',),
                        ),
                      );
                    },
                    child: Text(
                      'Add New',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          userShippingInformation['address'] == null
              ? // information Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffD6D3D1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  width: MediaQuery.sizeOf(context).width,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child:   //add button name
                      InkWell(
                        onTap: () {
                          // call bottom sheet bar
                          // inputShippingInformationBottomSheetBar(context, userName , userPhone, userPhone);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InputShippingData(whichBtn: 'add',),
                            ),
                          ).then((value) {
                            fetchData();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              'Add shipping information ',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              :
                // information Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffD6D3D1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  width: MediaQuery.sizeOf(context).width,
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        //user name & change button
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //user name
                                Text(
                                  '${userShippingInformation['customer_name']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                //user name
                                InkWell(
                                  onTap: () {
                                    // call bottom sheet bar
                                    // inputShippingInformationBottomSheetBar(context, userName , userPhone, userPhone);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InputShippingData(whichBtn: 'change',),
                                      ),
                                    ).then((value) {
                                      fetchData();
                                    });
                                  },
                                  child: Text(
                                    'Change',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // user contact
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${userShippingInformation['customer_phone']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // user shipping address
                        Expanded(
                          flex: 5,
                          child: Text(
                            '${userShippingInformation['address']}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
