import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
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
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Color(0xffF24C00), width: 2),
                            image: DecorationImage(
                              image: new AssetImage("assets/penulis.jpeg"),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text(
                        "Johan Inda Permana",
                        style: TextStyle(color: Color(0xff485696), fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text("johanpermana0910@gmail.com",
                          style: TextStyle(color: Color(0xff485696), fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: Color(0xffF24C00), width: 2)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.call,
                            color: Color(0xff485696),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: <Widget>[
                                Text("081555340114"),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.web,
                            color: Color(0xff485696),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("johanpermanablog.blogspot.com"))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.map,
                            color: Color(0xff485696),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Jalan SMA RT 001 RW 001 Desa Sonorejo Kecamatan Grogol Kabupaten Kediri",
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
//              Container(
//                margin: EdgeInsets.only(top: 10),
//                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                child: Text("Kompetensi Inti (KI)",
//                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//              ),
//              Container(
//                padding: EdgeInsets.symmetric(horizontal: 25),
//                child: Text("Memahami dan menerapkan pengetahuan faktual, konseptual, prosedural dalam ilmu "
//                    "pengetahuan, teknologi, seni, budaya, dan humaniora dengan wawasan kemanusiaan,  kebangsaan, "
//                    "kenegaraan, dan peradaban terkait fenomena dan kejadian, serta menerapkan pengetahuan prosedural pada bidang kajian yang spesifik sesuai dengan bakat dan minatnya untuk memecahkan masalah.",
//                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 10),
//                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                child: Text("Kompetensi Dasar (KD)",
//                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//              ),Container(
//                padding: EdgeInsets.symmetric(horizontal: 25),
//                child: Text("Menganalisis perkembangan kehidupan masyarakat, pemerintahan, dan budaya pada masa "
//                    "kerajaan-kerajaan Hindu dan Budha di Indonesia serta menunjukkan contoh bukti-bukti yang masih berlaku pada kehidupan masyarakat Indonesia masa kini.",
//                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
//              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
