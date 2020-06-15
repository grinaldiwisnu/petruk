import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petruk/bloc/main/bloc.dart';
import 'package:petruk/page/about_page.dart';
import 'package:petruk/page/evaluate_start_page.dart';
import 'package:petruk/page/faq_page.dart';
import 'package:petruk/page/map_page.dart';

class MainPage extends StatelessWidget {
  MainBloc mainBloc;

  @override
  Widget build(BuildContext context) {
    mainBloc = BlocProvider.of<MainBloc>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF9C784),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
//                      padding: EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "PETRUK",
                                style: TextStyle(color: Color(0xff485696), fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Panduan E-Trip Situs Kediri",
                                style: TextStyle(color: Color(0xff485696), fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child:
                                Container(alignment: Alignment.centerRight, child: Image.asset("assets/logo-um.png")))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      menuAction(icon: "assets/kikd.svg", name: "KI/KD", action: () {}),
                      menuAction(
                          icon: "assets/faq.svg",
                          name: "BANTUAN",
                          action: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FaqPage()));
                          }),
                      menuAction(
                          icon: "assets/location.svg",
                          name: "PETA",
                          action: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage()));
                          })
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      menuAction(
                          icon: "assets/evaluation.svg",
                          name: "EVALUASI",
                          action: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EvaluateStartPage()));
                          }),
                      menuAction(icon: "assets/more.svg", name: "DAFTAR PUSTAKA", action: () {}),
                      menuAction(
                          icon: "assets/about.svg",
                          name: "TENTANG",
                          action: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
                          })
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget menuAction({String icon, Function action, String name}) {
    return Expanded(
      child: InkWell(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffF24C00), width: 3),
              borderRadius: BorderRadius.circular(15)
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(icon, height: 60, alignment: Alignment.center,)
              ),
              Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color
                    (0xff424874)), textAlign: TextAlign.center,)
              )
            ],
          ),
        ),
      ),
    );
  }
}
