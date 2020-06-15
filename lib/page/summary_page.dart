import 'package:flutter/material.dart';
import 'package:petruk/bloc/evaluate/bloc.dart';
import 'package:petruk/page/main_page.dart';

class SummaryPage extends StatelessWidget {
  final EvaluateBloc evaluateBloc;

  const SummaryPage({Key key, this.evaluateBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hasil Evaluasi",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MainPage()), (Route<dynamic> route) => false);
            },
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Color(0xffF4EEFF),
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "Skor Kamu Adalah",
                  style: TextStyle(color: Color(0xff424874), fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                  evaluateBloc.score.toString(),
                  style: TextStyle(color: Color(0xff424874), fontSize: 76, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text("${(evaluateBloc.score / 10).round()} benar dari 10 Soal"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
