import 'dart:developer';

import 'package:dadaborkahouse/controller/cart.dart';
import 'package:dadaborkahouse/controller/order.dart';
import 'package:dadaborkahouse/view/Checkout/ui.dart';
import 'package:dadaborkahouse/view/widgets/single_product_cart_long.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

import '../widgets/long_button.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({super.key});

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  bool isLoading = false;
  List orderData = [];
  TextEditingController orderPhone = TextEditingController();
  void fetchData() async {
    isLoading = true;
    setState(() {});

    orderData = await OrderController().fetchOrder(
      userPhone: orderPhone.text,
    );

    isLoading = false;
// log("=======$orderData=======");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Padding(
        //   padding: const EdgeInsets.all(5.0),
        //   child: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: CircleAvatar(
        //       backgroundColor: Color(0xFFF6F6F6),
        //       radius: 2,
        //       child: Image(
        //         image: AssetImage("assets/mask_group.png"),
        //         width: 20,
        //         height: 20,
        //       ),
        //     ),
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          "Orders",
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
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 20),
              //Search box
              Row(
                children: [
                  //input search box
                  Expanded(
                    child: TextField(
                      controller: orderPhone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.search,
                            color: Color(0xFFB3B3B3),
                            size: 30,
                          ),
                        ),
                        hintText: "Search Orders",
                        hintStyle: TextStyle(color: Color(0xFFB3B3B3)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      fetchData();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFFF4A758),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 50,
                      child: Icon(Icons.search, color: Colors.white, size: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),

              isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : orderData.isEmpty
                  ? SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: Center(
                        child: Text(
                          "No Order Found",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: orderData.length,
                      itemBuilder: (context, index) {
                        // Order carts
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),

                            width: MediaQuery.sizeOf(context).width,
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //start side
                                  Flexible(
                                    flex:4,

                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        //order id
                                        Row(
                                          spacing: 5,
                                          children: [
                                            Text(
                                              'Order #: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Text(
                                              '${orderData[index]['order_id']}',
                                              style: TextStyle(
                                                color: Color(0xff6E62EF),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Ph: ${orderData[index]['customer_phone']}',
                                          style: TextStyle(
                                            color: Color(0xff626571),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),

                                        Card(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 5,
                                            ),
                                            child: Text(
                                              '${orderData[index]['payment_method']}',
                                              style: TextStyle(
                                                color: Color(0xff626571),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //end side
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'BDT ${orderData[index]['total_amount']}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffDFDCFD),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            border: Border.all(
                                              color: Color(0xff6E62EF),
                                              width: 1,
                                            ),
                                          ),
width: 65,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 3,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${orderData[index]['status']}',
                                                style: TextStyle(
                                                  color: Color(0xff6C5CD2),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
