import 'package:EscaTec/MainPAge.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanningPage extends StatefulWidget {
  ScanningPage(String s);
  @override
  _ScanningPageState createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  String info = "bar ocdd";

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
                showFormattedMessage("Scanning...", 40.9),
                Container(
                  color: Colors.indigoAccent,
                  height: 100,
                ),
                avc(), // click to scan
                Container(
                  color: Colors.indigoAccent,
                  height: 100,
                ),
                showButtonToGotoMainMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoHeader(BuildContext context) {
    AssetImage aImg = AssetImage("assets/logo.png");
    Image img = Image(image: aImg);
    return Container(child: img);
  }

  Widget showCredentials() {
    return Column(
      children: [
        Text(
          MainPage.username,
          style: TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.normal,
              fontSize: 25),
        ),
        Text(
          MainPage.email,
          style: TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.w700, fontSize: 25),
        ),
        Text(
          this.info,
          style: TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ],
    );
  }

  Widget showFormattedMessage(String msg, double size) {
    return Container(
      child: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: size),
      ),
    );
  }

  Widget showButtonToGotoMainMenu() {
    return Container(
      color: Colors.indigo,
      child: RaisedButton(
        onPressed: () {
          _gotoMainPage();
        },
        color: Colors.indigo,
        child: Text(
          "C A N C E L",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 38),
        ),
      ),
    );
  }

  Widget avc() {
    return SizedBox(
      height: 120,
      child: InkWell(
        onTap: () async => _scan,
        child: Card(
          elevation: 40.0,
          child: Text("Scan"),
        ),
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() {
      this.info = barcode;
    });
  }

  void _gotoMainPage() {
    Navigator.pop(context);
  }
}
