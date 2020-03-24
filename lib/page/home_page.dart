import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4EEFF),
      body: bodyHome(context),
    );
  }

  Widget bodyHome(BuildContext context) {
    return Container(
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
                  child: Text(
                    "Situs Yang Sering Dikunjungi",
                    style: TextStyle(
                        color: Color(0xff424874),
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset("assets/logo-um.png")
                    )
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                    ),
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.location_city),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Lokasi ${index}",
                                style: TextStyle(
                                  color: Color(0xff424874),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Jalan Bunga Camalia No.21",
                                style: TextStyle(
                                  color: Color(0xff686868),
                                  fontSize: 14
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
