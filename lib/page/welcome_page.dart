import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petruk/page/main_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bodyWelcome(context),
        backgroundColor: Color(0xffF4EEFF),
      ),
    );
  }

  Widget bodyWelcome(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            alignment: Alignment.centerRight,
            child: Image.asset("assets/logo-um.png"),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 25),
            alignment: Alignment.center,
            child: Image.asset("assets/logo.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "PETRUK",
              style: TextStyle(
                color: Color(0xff424874),
                fontSize: 48,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Text(
            "Panduan E-Trip Situs Kediri",
            style: TextStyle(
              color: Color(0xff424874),
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: FlatButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage())),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              color: Color(0xffA6B1E1),
              child: Text("Mulai Berpetualang!", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
