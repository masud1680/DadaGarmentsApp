import 'package:flutter/material.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    super.key, required this.categoryItem,
  });
final Map categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFEFAF5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE4E4E7),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      height: 100,
      width: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${categoryItem['name']}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "380 Items",
              style: TextStyle(
                color: Color(0xFF9F9FA9),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}