import 'package:flutter/material.dart';
import 'package:sandbox/screens/Welcome.dart';

import 'package:sandbox/screens/signup_screen.dart';

String? email1;
String? password1;

class Login extends StatefulWidget {
  static const id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool is_visibility = false;
  bool is_visibility2 = false;
  String name = "";
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(206, 0, 55, 1),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: 20),
          Hero(
            tag: 'logo',
            child: Image.asset("assets/logo/logo_trial.png", scale: 1.5),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 16, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              height: 350,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: username,
                      onChanged: (value) {
                        email1 = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        hintText: "Username",
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      controller: password,
                      onChanged: (value) {
                        password1 = value;
                      },
                      obscureText: !is_visibility2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              is_visibility2 = !is_visibility2;
                            });
                          },
                          icon: is_visibility2
                              ? Icon(
                                  Icons.visibility,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromARGB(255, 0, 0, 0)),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color.fromARGB(255, 190, 169, 175))),
                        onPressed: () async {
                          try {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.all(16),
                                behavior: SnackBarBehavior.floating,
                                content: Text("Login Successfull")));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => Welcome()),
                              (route) => false,
                            );
                          } catch (e) {
                            print(e);
                          }
                          password.clear();
                          username.clear();
                        },
                        child: Text("Login")),
                    Text("Dont have an account"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromARGB(255, 0, 0, 0)),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color.fromARGB(255, 190, 169, 175))),
                        child: Text("Sign in"),
                        onPressed: () {
                          Navigator.pushNamed(context, Signup.id);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
