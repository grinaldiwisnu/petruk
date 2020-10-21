import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petruk/bloc/sitation/bloc.dart';

class SitationPage extends StatelessWidget {
  SitationBloc sitationBloc;

  @override
  Widget build(BuildContext context) {
    sitationBloc = SitationBloc();
    sitationBloc.dispatch(LoadSitationEvent());

    return BlocListener(
      listener: (context, state) {},
      bloc: sitationBloc,
      child: BlocBuilder(
        bloc: sitationBloc,
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: Color(0xffF9C784),
            body: SingleChildScrollView(
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
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
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
                              child:
                                  Container(alignment: Alignment.centerRight, child: Image.asset("assets/logo-um.png")))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      height: MediaQuery.of(context).size.height - 125,
                      child: ListView.builder(
                        itemCount: sitationBloc.listSitation.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            margin: EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: Text(
                              sitationBloc.listSitation[index].RUJUKAN,
                              style: TextStyle(color: Color(0xff485696), fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
