import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginView(context);
  }
}

class LoginView extends StatefulWidget {
  LoginView(BuildContext context);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  List<Color> colors = [
    Colors.green,
    Colors.blue,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
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
                Container(
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
                    padding: const EdgeInsets.only(
                        top: 20, right: 14, left: 14, bottom: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (girilenEmail) {},
                                  onSaved: (girilenEmail) {
                                    setState(() {});
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 68.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    validator: (girilenSifre) {},
                                    onSaved: (girilenSifre) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "login",
                                    style:
                                        TextStyle(color: Colors.green.shade100),
                                  ),
                                ),
                                Divider(),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.indigo.shade100),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
