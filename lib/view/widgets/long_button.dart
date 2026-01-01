import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    super.key, required this.btnName,
  });
  final String btnName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color( 0xFFF4A758),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD4D4D4),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      width: double.infinity,
      height: 50,
      child: Center(
        child: Text(
          btnName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}