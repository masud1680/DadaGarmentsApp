import 'package:dadaborkahouse/cart_screen.dart';
import 'package:dadaborkahouse/categories_screen.dart';
import 'package:dadaborkahouse/discount_screen.dart';
import 'package:dadaborkahouse/edit_profile.dart';
import 'package:dadaborkahouse/home_screen.dart';
import 'package:dadaborkahouse/product_details.dart';
import 'package:dadaborkahouse/profile.dart';
import 'package:dadaborkahouse/signIn_screen.dart';
import 'package:dadaborkahouse/signUp_screen.dart';
import 'package:dadaborkahouse/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      // home: SignInScreen(),
      // home: SignUpScreen(),
      // home: Profile(),
      // home: CategoriesScreen(),
      // home: CartScreen(),
      // home: EditProfile(),
      // home: ProductDetails(),
      // home: DiscountScreen(),
      home: HomeScreen(),
    )
  );
}