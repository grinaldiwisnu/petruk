import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petruk/bloc/evaluate/bloc.dart';
import 'package:petruk/page/summary_page.dart';

class EvaluationPage extends StatefulWidget {
  final EvaluateBloc evaluateBloc;

  EvaluationPage({Key key, this.evaluateBloc}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  Map<String, dynamic> selectedAnswer = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocListener(
        bloc: widget.evaluateBloc,
        listener: (context, state) {
          if (state is AnswerWrongState) {
          } else if (state is AnswerCorrectState) {
          } else if (state is NextQuestionLoadedState) {
            this.selectedAnswer = {};
          }
        },
        child: BlocBuilder(
          bloc: widget.evaluateBloc,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Evaluasi ${widget.evaluateBloc.counter} dari ${widget.evaluateBloc.maxQuestion}",
                  style: TextStyle(color: Colors.black),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Apakah anda yakin ingin membatalkan evaluasi?"),
                            elevation: 1,
                            content: Text(
                                "Semua jawaban dan nilai yang telah diperoleh akan hilang jika anda membatalkan evaluasi"),
                            actions: <Widget>[
                              FlatButton(onPressed: () => Navigator.pop(context), child: Text("Tutup")),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Setuju")),
                            ],
                          );
                        });
                  },
                ),
                backgroundColor: Colors.white,
                elevation: 1,
              ),
              backgroundColor: Color(0xffF9C784),
              body: SingleChildScrollView(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                child: Column(
                  children: <Widget>[
                    widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].GAMBAR != null &&
                            widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].GAMBAR != ""
                        ? Container(
                            child: Image(
                              image: NetworkImage(
                                  widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].GAMBAR),
                            ),
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      child: Text(widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].PERTANYAAN,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].PILIHAN.length,
                      itemBuilder: (context, index) {
                        String data = widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].PILIHAN[index];
                        bool actual =
                            data.compareTo(widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].JAWABAN) ==
                                    0
                                ? true
                                : false;
                        return InkWell(
                          onTap: () {
                            if (widget.evaluateBloc.showHint == false) {
                              setState(() {
                                selectedAnswer = {"index": index, "data": data};
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedAnswer["index"] == index
                                  ? widget.evaluateBloc.showHint == true
                                      ? actual ? Colors.lightGreen : Colors.red
                                      : Color(0xff424874)
                                  : Colors.white,
                              border: Border.all(color: Color(0xff424874)),
                            ),
                            child: Text(
                              data,
                              style:
                                  TextStyle(color: selectedAnswer["index"] == index ? Colors.white : Color(0xff424874)),
                            ),
                          ),
                        );
                      },
                    ),
                    widget.evaluateBloc.showHint
                        ? Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              "PEMBAHASAN : " +
                                  widget.evaluateBloc.listQuestion[widget.evaluateBloc.counter - 1].PEMBAHASAN,
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.lightGreen),
                            ),
                          )
                        : Container()
                  ],
                ),
              )),
              bottomNavigationBar: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: widget.evaluateBloc.counter2 <= widget.evaluateBloc.maxQuestion
                    ? Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (widget.evaluateBloc.showHint == false) {
                                  widget.evaluateBloc.dispatch(SubmitAnswerEvent(answer: selectedAnswer['data']));
                                } else {}
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff485696),
                                ),
                                child: Text(
                                  "Cek Jawaban",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (widget.evaluateBloc.showHint == true) {
                                  widget.evaluateBloc.dispatch(NextQuestionEvent());
                                } else {}
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff485696),
                                ),
                                child: Text(
                                  "Soal Selanjutnya",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => SummaryPage(
                                              evaluateBloc: widget.evaluateBloc,
                                            )),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffA6B1E1),
                                ),
                                child: Text(
                                  "Lihat Nilai",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Apakah anda yakin ingin membatalkan evaluasi?"),
                elevation: 1,
                content:
                    Text("Semua jawaban dan nilai yang telah diperoleh akan hilang jika anda membatalkan evaluasi"),
                actions: <Widget>[
                  FlatButton(onPressed: () => Navigator.pop(context, false), child: Text("Tutup")),
                  FlatButton(onPressed: () => Navigator.pop(context, true), child: Text("Setuju")),
                ],
              );
            })) ??
        false;
  }
}
