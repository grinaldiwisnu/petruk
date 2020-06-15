import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        child: Container(alignment: Alignment.centerRight, child: Image.asset("assets/logo-um.png")))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Panduan Penggunaan : ",
                  style: TextStyle(color: Color(0xff485696), fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "1. Buka aplikasi PETRUK yang sudah diinstall.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "2. Pilih peta untuk melihat persebaran situs peninggalan yang ada di Kediri.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "3. Unduh dan baca materi yang diberikan, dan jangan lupa tonton video penjelasannya.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "4. Jika dirasa sudah selesai, silahkan lakukan evaluasi materi.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Selamat Belajar!",
                  style: TextStyle(color: Color(0xffFC7A1E), fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
