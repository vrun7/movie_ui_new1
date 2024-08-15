import 'package:flutter/material.dart';
import 'package:movie_ui_new/screens/login_page_screen.dart';

class signupform extends StatefulWidget {
  const signupform({super.key});

  @override
  State<signupform> createState() => _signupformState();
}

class _signupformState extends State<signupform> {
  var formkey = GlobalKey<FormState>();
  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
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
    text1.addListener(update);
    text2.addListener(update);
    super.initState();
  }

  void update() {
    setState(() {
      disablebtn = text1.text.isNotEmpty && text2.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                  key: formkey,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: AssetImage("assets/image/logo.png"),
                          ),
                        ),
                        Text("Sign up",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text("Create Your Account",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.green.withOpacity(0.1),
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              labelText: "Username",
                              labelStyle: TextStyle(fontSize: 14),
                              hintText: "enter your username",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2))),
                          controller: text1,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Enter some username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: text2,
                          decoration: InputDecoration(
                              fillColor: Colors.green.withOpacity(0.1),
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 14),
                              hintText: "enter you Email",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2))),
                          validator: (text) {
                            if (text!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(text)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          obscureText: obsvalue,
                          decoration: InputDecoration(
                              suffix: Icon(Icons.remove_red_eye),
                              fillColor: Colors.green.withOpacity(0.1),
                              filled: true,
                              prefixIcon: Icon(Icons.password),
                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 14),
                              hintText: "enter your password",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none)),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Enter a valid password!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              fillColor: Colors.green.withOpacity(0.1),
                              filled: true,
                              prefixIcon: Icon(Icons.password_outlined),
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(fontSize: 14),
                              hintText: "re-enter the password",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none)),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Enter a valid password!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 270,
                          height: 43,
                          child: ElevatedButton(
                              onPressed: disablebtn
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  loginform()));
                                    }
                                  : null,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.green[300])),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text("or"),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 270,
                          height: 43,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Sign in with Google",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.green.withOpacity(0.5),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Colors.white,
                              )),
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => loginform()));
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.green.withOpacity(0.7),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)))
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    ));
  }
}
