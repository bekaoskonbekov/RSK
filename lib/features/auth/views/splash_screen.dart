import 'package:flutter/material.dart';
import 'package:rsk1/features/auth/views/login_screen.dart';

import '../../../routes/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
       Routes.instance.push(widget: LoginScreen(), context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
