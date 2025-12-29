
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../auth/login/ui.dart';
import '../navbar/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void delay()async{
    await Future.delayed(Duration(seconds: 2));

    final storage = FlutterSecureStorage();
    if( await storage.read(key: 'token') != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>  NavSwitchScreen(),));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
    }

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
