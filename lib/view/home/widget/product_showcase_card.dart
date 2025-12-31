import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:dadaborkahouse/view/product/ui.dart';
import 'package:flutter/material.dart';

import '../../widgets/product_card.dart';

class ProductShowCase extends StatelessWidget {
  const ProductShowCase({
    super.key,
    required this.productList,
    required this.cardName,
    required this.cardKeyName,
    required this.reloadData,
  });
  final List productList;

  final String cardName;
  final String cardKeyName;
  final VoidCallback reloadData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cardName,
              style: TextStyle(
                color: Color(0xFF5B5B5B),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductsScreen(whichPage: cardName, cardKeyName:cardKeyName),
                  ),
                ).then((value) {
                  reloadData();
                });
              },
              child: Text(
                "See all",
                style: TextStyle(
                  color: Color(0xFFF99B2B),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              //single card
              return ProductCard(product: productList[index], pDA: 5);
            },
          ),
        ),
      ],
    );
  }
}
