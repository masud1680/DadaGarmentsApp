import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:dadaborkahouse/controller/cart.dart';
import 'package:dadaborkahouse/controller/product.dart';
import 'package:dadaborkahouse/view/product_details/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../auth/login/ui.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.pDA});

  final Map product;
  final double? pDA;
  // final double? imgWi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pDA ?? 2),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(productId: product['id']),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFD4D4D4),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          // height: 300,
          width: 170,
          child: Column(
            spacing: 10,
            children: [
              Expanded(
                flex: 5,
                child: FadeInImage.assetNetwork(placeholder: 'assets/loading_img/noImage.jpg', image: '${GetBaseUrl.imgBaseUrl}/${product['image']}',) ,
              ),

              Flexible(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: 8,
                    left: 5,
                    right: 5,
                  ),
                  child: Column(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //product name & price
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Name
                            Text(
                              "${product['title']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            // price
                            Row(
                              spacing: 7,
                              children: [
                                Text(
                                  "${product['price']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "${product['old_price']}",
                                  style: TextStyle(
                                    color: Color(0xFFB3B3B3),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Add To Cart Button
                      InkWell(
                        onTap: () async {
                          int statusCode = await CartController().addToCat(
                            productId: product['id'],
                            quantity: 1,
                          );
                          if (statusCode == 200) {
                            EasyLoading.showSuccess("Product Add Successful");
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFE5E5E5),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          width: 110,
                          height: 35,
                          child: Center(
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return Container(
    //   margin: EdgeInsets.symmetric(
    //     horizontal: 5,
    //     vertical: 10,
    //   ),
    //
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //         color: Color(0xFFD4D4D4),
    //         spreadRadius: 1,
    //         blurRadius: 2,
    //       ),
    //     ],
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   height: 300,
    //   width: 170,
    //   child: Column(
    //     spacing: 10,
    //     children: [
    //       Image(
    //         image: NetworkImage('${GetBaseUrl.imgBaseUrl}/${product['image']}'),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 5,
    //           vertical: 5,
    //         ),
    //         child: Column(
    //           spacing: 12,
    //           children: [
    //             //product name & price
    //             Padding(
    //               padding: const EdgeInsets.only(left: 5),
    //               child: Column(
    //                 crossAxisAlignment:
    //                 CrossAxisAlignment.start,
    //                 children: [
    //                   //Name
    //                   Text(
    //                     "${product['title']}",
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: 10,
    //                     ),
    //                   ),
    //                   // price
    //                   Row(
    //                     spacing: 7,
    //                     children: [
    //                       Text(
    //                         "${product['price']}",
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 13,
    //                         ),
    //                       ),
    //                       Text(
    //                         "${product['old_price']}",
    //                         style: TextStyle(
    //                           color: Color(0xFFB3B3B3),
    //                           fontWeight: FontWeight.w400,
    //                           fontSize: 12,
    //                           decoration: TextDecoration
    //                               .lineThrough,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //
    //             // Add To Cart Button
    //             Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(10),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Color(0xFFE5E5E5),
    //                     spreadRadius: 1,
    //                     blurRadius: 1,
    //                   ),
    //                 ],
    //               ),
    //               width: 110,
    //               height: 35,
    //               child: Center(
    //                 child: Text(
    //                   "Add To Cart",
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 14,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
