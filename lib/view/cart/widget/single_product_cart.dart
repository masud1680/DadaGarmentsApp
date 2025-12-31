import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:flutter/material.dart';

class SingleProductCart extends StatelessWidget {
  const SingleProductCart({super.key, required this.product});

  final Map product;

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

              child: FadeInImage.assetNetwork(placeholder: 'assets/loading_img/noImage.jpg', image: '${GetBaseUrl.imgBaseUrl}/${product['image']}', fit: BoxFit.fill,),
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
                        "BDT ${product['price']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "BDT ${product['total']}",
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
                    CircleAvatar(
                      backgroundColor: Color(0xFFF4A758),
                      radius: 12,
                      child: Icon(Icons.add, color: Colors.black),
                    ),
                    Text(
                      "${product['quantity']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xFFF4A758),
                      radius: 12,
                      child: Icon(Icons.remove, color: Colors.black),
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
