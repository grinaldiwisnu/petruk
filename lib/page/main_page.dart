import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petruk/page/home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomePage(),
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xff000000).withAlpha(20), blurRadius: 5, offset: Offset(0, -1))
        ],
        color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          bottomNavAction(icon: "assets/ic_home.svg", name: "Home", action: () {print("aaaaa");}),
          bottomNavAction(icon: "assets/ic_map.svg", name: "Peta", action: () {}),
          bottomNavAction(icon: "assets/ic_assessment.svg", name: "Evaluasi", action: () {}),
          bottomNavAction(icon: "assets/ic_about.svg", name: "Tentang", action: () {})
        ],
      ),
    );
  }

  Widget bottomNavAction({String icon, Function action, String name}) {
    return Expanded(
      child: InkWell(
        onTap: action,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(icon),
              Text(name, style: TextStyle(fontSize: 12, color: Color(0xff424874)),)
            ],
          ),
        ),
      ),
    );
  }
}
