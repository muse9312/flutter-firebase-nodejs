import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:client/login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpView extends StatefulWidget {
  const SignUpView(BuildContext context, {super.key});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> sendData() async {
    final response = await http.post(
      Uri.parse('${dotenv.env['SERVER_ADDRESS']}/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      print("회원가입 성공");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginView(context)));
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
                  child: const Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 54,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / (4 / 3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 14, left: 14, bottom: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // 아이디 입력
                              TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child:

                                    // 패스워드 입력
                                    TextField(
                                  controller: passwordController,
                                  obscureText: true, // 자판 안보이게
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      sendData();
                                    },
                                    child: Text(
                                      "rigster",
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
