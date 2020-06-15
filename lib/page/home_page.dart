import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petruk/bloc/home/bloc.dart';

class HomePage extends StatelessWidget {
  HomeBloc _homeBloc;

  @override
  Widget build(BuildContext context) {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.dispatch(LoadHomeEvent());

    return Scaffold(
      backgroundColor: Color(0xffF4EEFF),
      body: bodyHome(context),
    );
  }

  Widget bodyHome(BuildContext context) {
    return BlocListener(
      bloc: _homeBloc,
      listener: (context, state) {},
      child: BlocBuilder(
        bloc: _homeBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: TextStyle(color: Color(0xff424874), fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Panduan E-Trip Situs Kediri",
                                style: TextStyle(color: Color(0xff424874), fontSize: 14, fontWeight: FontWeight.normal),
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
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 5),
                    alignment: Alignment.center,
                    child: Text(
                      "Panduan Penggunaan : ",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset("assets/step1.png"),
                      ),
                      Container(
                        child: Image.asset("assets/step2.png"),
                      ),
                      Container(
                        child: Image.asset("assets/step3.png"),
                      ),
                      Container(
                        child: Image.asset("assets/step4.png"),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    alignment: Alignment.center,
                    child: Text(
                      "Selamat Belajar!",
                      style: TextStyle(color: Color(0xffFF8355), fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
