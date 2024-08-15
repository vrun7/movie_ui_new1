import 'package:flutter/material.dart';
import 'package:movie_ui_new/screens/signup.dart';
import 'package:movie_ui_new/screens/welcome_screen.dart';

class loginform extends StatefulWidget {
  const loginform({super.key});

  @override
  State<loginform> createState() => _signupformState();
}

class _signupformState extends State<loginform> {
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
                          width: 100,
                          height: 100,
                        ),
                        Text("Login",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text("Login Your Account",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.red.withOpacity(0.1),
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              labelText: "Username",
                              labelStyle: TextStyle(fontSize: 14),
                              hintText: "enter you username",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2))),
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
                              fillColor: Colors.red.withOpacity(0.1),
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
                                                  WelcomeScreen()));
                                    }
                                  : null,
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 17),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.black)),
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
                              border: Border.all(color: Colors.purple),
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Sign in with Google",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.purple,
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
                                          builder: (context) => signupform()));
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.purple,
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
