import 'package:EscaTec/MainPAge.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                logoHeader(context), // This function returns the LOGO
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: credentialsForm(context),
                ),
                Container(
                  color: Colors.indigo,
                  child: RaisedButton(
                    onPressed: () {
                      _loginFunction();
                    },
                    color: Colors.indigo,
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 38),
                    ),
                  ),
                ),
                footterMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoHeader(BuildContext context) {
    AssetImage aImg = AssetImage("assets/logo.png");
    Image img = Image(
      image: aImg,
    );
    return Container(
      child: img,
    );
  }

  Widget footterMessage() {
    return Column(
      children: [
        Text("DONT HAVE ACCOUNT?"),
        Text("PLEASE CONTACT"),
        Text("ADMIN AT IT DEPARTMENT"),
      ],
    );
  }

  Widget credentialsForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            decoration: InputDecoration(
              hintText: "USERNAME or EMAIL",
              hintStyle: TextStyle(color: Colors.indigo, fontSize: 15),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            decoration: InputDecoration(
              hintText: "PASSWORD",
              hintStyle: TextStyle(color: Colors.indigo, fontSize: 15),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  void _loginFunction() {
    bool correctCredentials = true;
    if (correctCredentials) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainPage("UserName", "username@gmail.com");
          },
        ),
      );
    }
  }
}
