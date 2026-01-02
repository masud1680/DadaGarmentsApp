import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:dadaborkahouse/controller/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../auth/login/ui.dart';

class SingleProductCart extends StatelessWidget {
  const SingleProductCart({
    super.key,
    required this.product,
    required this.fetchData,
    required this.countUpdateBtnShow,
  });
  final bool countUpdateBtnShow;
  final Map product;
  final VoidCallback fetchData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF8F2ED),
        boxShadow: [
          BoxShadow(color: Color(0xFFE5E5E5), spreadRadius: 1, blurRadius: 1),
        ],
        borderRadius: BorderRadius.circular(10),
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
                borderRadius: BorderRadius.circular(10),
              ),
              height: 90,
              width: 90,

              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading_img/noImage.jpg',
                image: '${GetBaseUrl.imgBaseUrl}/${product['image']}',
                fit: BoxFit.fill,
              ),
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
                    "${product['title']}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "SKU: ${product['sku']}",
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
                        "BDT ${product['total']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "BDT ${product['price']}",
                        style: TextStyle(
                          // color: Color(0xFFB3B3B3),
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          // decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          countUpdateBtnShow == false
              ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFFFBE9D7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 30,
                      height: 30,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Center(
                          child: Text(
                            "${product['quantity']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              )
              :
                // items count increment & decrement button
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
                          InkWell(
                            onTap: () async {
                              int plusQuantity = product['quantity'] + 1;
                              int statusCode = await CartController().addToCat(
                                productId: product['product_id'],
                                quantity: plusQuantity,
                              );
                              if (statusCode == 200) {
                                fetchData();
                                // EasyLoading.showSuccess("Product Add Successful");
                              } else if (statusCode == 401) {
                                EasyLoading.showError('Unauthorized');
                                final storage = FlutterSecureStorage();
                                storage.deleteAll();

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFF4A758),
                              radius: 12,
                              child: Icon(Icons.add, color: Colors.black),
                            ),
                          ),
                          Text(
                            "${product['quantity']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),

                          InkWell(
                            onTap: () async {
                              int minusQuantity = product['quantity'] - 1;
                              int statusCode = await CartController().addToCat(
                                productId: product['product_id'],
                                quantity: minusQuantity,
                              );

                              if (statusCode == 200) {
                                fetchData();
                                // EasyLoading.showSuccess("Product Add Successful");
                              } else if (statusCode == 401) {
                                EasyLoading.showError('Unauthorized');
                                final storage = FlutterSecureStorage();
                                storage.deleteAll();

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFF4A758),
                              radius: 12,
                              child: Icon(Icons.remove, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
