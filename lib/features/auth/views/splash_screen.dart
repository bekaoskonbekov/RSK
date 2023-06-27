import 'package:flutter/material.dart';
import 'package:rsk1/features/auth/views/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Image(
          width: double.infinity,
          height: 70,
          fit: BoxFit.contain,
           color: Color.fromARGB(255, 24, 29, 173),
              image: AssetImage(
            'assets/Logo 1.png',
            
            
          )),
        ),
      ),
    );
  }
}
