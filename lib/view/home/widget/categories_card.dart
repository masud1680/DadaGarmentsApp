import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key, required this.categories,
  });
  final Map categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.green,
        image: DecorationImage(
          image: NetworkImage("${GetBaseUrl.imgBaseUrl}/${categories['image']}"),
          fit: BoxFit.fill,
        ),
      ),
      height: 100,
      width: 105,
      child: Padding(
        padding: EdgeInsets.only(top: 75, bottom: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF2E2827),
          ),
          height: 25,
          width: 105,
          child: Center(
            child: Text(
              "${categories['name']}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}