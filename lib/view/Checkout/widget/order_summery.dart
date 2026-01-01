import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key, required this.orderSummary,
  });
final Map orderSummary;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE5E5E5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      width: double.infinity,
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Order Summary",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          // total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              Text(
                "${orderSummary['total_p']}",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          // Shipping cost
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Cost",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              Text(
                "${orderSummary['s_cost']}",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          // Delivery Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Location",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              Text(
                "${orderSummary['d_location']}",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(color: Color(0xFFD4D4D8)),
            height: 1,
            width: double.infinity,
          ),
          // overall Total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              Text(
                "${orderSummary['total_d']}",
                style: TextStyle(
                  color: Color(0xFF9F9FA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}