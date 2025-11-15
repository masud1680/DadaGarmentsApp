import 'package:dadaborkahouse/navSwitch_Screen.dart';
import 'package:dadaborkahouse/signIn_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void delay()async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
  }

  @override
  void initState() {
    // TODO: implement initState
    delay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splash_screen.png"),
                // fit: BoxFit.fill
            ),
          ),

          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
