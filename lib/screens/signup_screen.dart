import 'package:flutter/material.dart';
import 'package:sandbox/screens/Welcome.dart';
import 'package:sandbox/screens/login_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const id = 'Signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email;
  String? password;
  String? username;
  String? newUser;
  bool is_visibility = false;
  bool is_visibility2 = false;

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(206, 0, 55, 1),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBox(height: 20),
              Hero(
                tag: 'logo',
                child: Image.asset(
                  "assets/logo/logo_trial.png",
                  scale: 1.5,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                height: 480,
                width: double.infinity,
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    TextFormField(
                      controller: _username,
                      onChanged: (value) {
                        username = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        hintText: "Username",
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      controller: _email,
                      onChanged: (value) {
                        print(email);
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        hintText: "Email",
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      controller: _password,
                      obscureText: !is_visibility2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Create new Password",
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
                                  ),
                          ),
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          hintText: "Password"),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      controller: _confirm,
                      obscureText: !is_visibility,
                      onChanged: (value) {
                        password = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Confirm the password",
                        prefixIcon: Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              is_visibility = !is_visibility;
                            });
                          },
                          icon: is_visibility
                              ? Icon(
                                  Icons.visibility,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                ),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 0, 0, 0)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 190, 169, 175))),
                      onPressed: () async {
                        try {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(16),
                              behavior: SnackBarBehavior.floating,
                              content: Text("Sign-up Successfull")));
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => Welcome()),
                            (route) => false,
                          );
                          setState(() {
                            _email.clear();
                            _confirm.clear();
                            _username.clear();
                            _password.clear();
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text('SignUp'),
                    ),
                    SizedBox(height: 10),
                    Text("Already have an account"),
                    SizedBox(height: 10),
                    ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromARGB(255, 0, 0, 0)),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color.fromARGB(255, 190, 169, 175))),
                        onPressed: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: Text("Log-In"))
                  ]),
                ),
              ),
            ]),
      )),
    );
  }
}
