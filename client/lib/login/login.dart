import 'dart:convert';

import 'package:client/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView(BuildContext context, {super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late bool _loginCheck = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> sendData() async {
    final res = await http.post(
      Uri.parse('${dotenv.env['SERVER_ADDRESS']}/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (res.statusCode == 200) {
      print("로그인 성공");
      setState(() {
        _loginCheck = true;
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to send data');
    }
  }

  List<Color> colors = [
    Colors.green,
    Colors.blue,
  ];

  @override
  void initState() {
    super.initState();
    dotenv.load();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 54,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / (4 / 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, right: 14, left: 14, bottom: 14),
                    child: _loginCheck
                        ? Row(
                            children: [
                              Text("로그인 성공"),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20, bottom: 68.0),
                                      child: TextField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: "Password",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            sendData();
                                          },
                                          child: Text(
                                            "login",
                                            style: TextStyle(
                                                color: Colors.green.shade100),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUpView(context)));
                                          },
                                          child: Text(
                                            "SignUp",
                                            style: TextStyle(
                                                color: Colors.indigo.shade100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
