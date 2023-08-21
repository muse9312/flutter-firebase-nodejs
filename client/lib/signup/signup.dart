import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView(BuildContext context, {super.key});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                                  validator: (girilenEmail) {
                                    return null;
                                  },
                                  onSaved: (girilenEmail) {
                                    setState(() {});
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    validator: (girilenSifre) {
                                      return null;
                                    },
                                    onSaved: (girilenSifre) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 68.0),
                                  child: TextFormField(
                                    // obscureText: true, // 비번 안보이게
                                    decoration: InputDecoration(
                                      labelText: "CarNumber",
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
                                      onPressed: () {},
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
