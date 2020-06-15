import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petruk/bloc/evaluate/bloc.dart';
import 'package:petruk/page/evaluation_page.dart';

class EvaluateStartPage extends StatelessWidget {
  EvaluateBloc evaluateBloc;

  @override
  Widget build(BuildContext context) {
    evaluateBloc = EvaluateBloc();

    return BlocListener(
      listener: (context, state) {
        if (state is QuestionLoadedState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EvaluationPage(
                        evaluateBloc: evaluateBloc,
                      )));
        }
      },
      bloc: evaluateBloc,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffF9C784),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: IconButton(
                            color: Color(0xffFC7A1E),
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Expanded(
                          child: Container(alignment: Alignment.centerRight, child: Image.asset("assets/logo-um.png")))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Sudah Siap Untuk Evaluasi ?",
                    style: TextStyle(color: Color(0xff4E537D), fontSize: 24),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () => evaluateBloc.dispatch(LoadQuestionEvent()),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff485696),
//                        border: Border.all(color: Color(0xffF24C00), width: 3),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                          "Mulai Evaluasi",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
