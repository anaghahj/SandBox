import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sandbox/screens/Welcome.dart';
import 'package:sandbox/screens/login_screen.dart';
import 'package:sandbox/screens/signup_screen.dart';
import 'package:sandbox/screens/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TecHub",
      theme: ThemeData(
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromARGB(255, 189, 163, 170),
          ),
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hoverColor: const Color.fromRGBO(206, 0, 55, 1),
              activeIndicatorBorder:
                  BorderSide(color: const Color.fromRGBO(206, 0, 55, 1))),
          searchBarTheme: SearchBarThemeData(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromRGBO(206, 0, 55, 1)))),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Login.id: (context) => Login(),
        Signup.id: (context) => Signup(),
        Welcome.id: (context) => Welcome(),
      },
    );
  }
}
