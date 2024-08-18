import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_ui_new/core/theme/app_color.dart';
import 'package:movie_ui_new/screens/signup_screen.dart';
import 'package:movie_ui_new/screens/welcome_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool disablebtn = false;
  bool obsvalue = false;

  showbutton() {
    if (obsvalue == true) {
      obsvalue = false;
    } else {
      obsvalue = true;
    }
  }

  @override
  void initState() {
    _usernameController.addListener(update);
    _passwordController.addListener(update);
    super.initState();
  }

  void update() {
    setState(() {
      disablebtn = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 200,
                      height: 200,
                      child: Image(image: AssetImage("assets/logo1.png"))),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Login to Your Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 17),
                    ),
                    onPressed: disablebtn
                        ? () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Process login here
                              final username = _usernameController.text;
                              final password = _passwordController.text;
                              // Perform login logic (e.g., API call) here
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Logging in as $username')),
                              );
                              Timer(
                                  Duration(seconds: 4),
                                  () => Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            WelcomeScreen(),
                                      )));
                            }
                          }
                        : null,
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text('Don\'t have an account? Sign up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
