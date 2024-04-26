import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static final id = "splascreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(Login.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(206, 0, 55, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset(
                'assets/logo/logo_trial.png',
                height: 400,
                width: 400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SpinKitWanderingCubes(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
