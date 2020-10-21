import 'package:flutter/material.dart';

class KikdPage extends StatelessWidget {
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
                        borderRadius: BorderRadius.circular(40),
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
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Aplikasi PETRUK (Panduan E-Trip Situs Kediri) merupakan sebuah media pembelajaran sehingga aplikasi PETRUK juga dikembangkan sesuai dengan kurikulum yang digunakan di pendidikan Indonesia yaitu Kurikulum 2013 sehingga aplikasi PETRUK memiliki kompetensi inti, kompetensi dasar, indikator, dan tujuan",
                  style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Kompetensi Inti",
                  style: TextStyle(color: Color(0xff485696), fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      child: Text("3."),
                    ),
                    Expanded(
                      child: Text(
                        "Memahami dan menerapkan pengetahuan faktual, konseptual, prosedural dalam ilmu pengetahuan, teknologi, seni, budaya, dan humaniora dengan wawasan kemanusiaan,  kebangsaan, kenegaraan, dan peradaban terkait fenomena dan kejadian, serta menerapkan pengetahuan prosedural pada bidang kajian yang spesifik sesuai dengan bakat dan minatnya untuk memecahkan masalah.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      child: Text("4."),
                    ),
                    Expanded(
                      child: Text(
                        "Mengolah, menalar, dan menyaji dalam ranah konkret dan ranah abstrak terkait dengan "
                        "pengembangan dari yang dipelajarinya di sekolah secara mandiri, bertindak secara efektif dan kreatif, serta mampu menggunakan metode sesuai kaidah keilmuan.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Kompetensi Dasar",
                  style: TextStyle(color: Color(0xff485696), fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      child: Text("3.6."),
                    ),
                    Expanded(
                      child: Text(
                        "Menganalisis kerajaan-kerajaan maritim Indonesia pada masa Hindu dan Budha dalam sistem "
                        "pemerintahan sosial, ekonomi, dan kebudayaan serta pengarunhya dalam kehidupan masayarakat Indonesia pada masa kini.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      child: Text("4.1."),
                    ),
                    Expanded(
                      child: Text(
                        "Menyajikan hasil analisis tentang kerajaan-kerajaan maritim Indonesia pada masa Hindu "
                        "dan Budha dalam sistem pemerintahan sosial, ekonomi, dan kebudayaan serta pengaruhnya dalam kehidupan masyarakat Indonesia pada masa kini dalam bentuk tulisan dan/atau media lain.",
                        style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Indikator",
                  style: TextStyle(color: Color(0xff485696), fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("3.6.1."),
                          ),
                          Expanded(
                            child: Text(
                              "Menganalisis peninggalan kerajaan Kadiri di wilayah Kabupaten Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("3.6.2."),
                          ),
                          Expanded(
                            child: Text(
                              "Menganalisis peninggalan kerajaan Singhasari di Kabupaten Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("3.6.3."),
                          ),
                          Expanded(
                            child: Text(
                              "Menganalisis peninggalan kerajaan Majaphit di Kabupaten Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("4.1.1."),
                          ),
                          Expanded(
                            child: Text(
                              "Menyapaikan dalam bentuk tulisan hasil analisis peninggalan kerajaan Kadiri di wilayah Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("4.1.2."),
                          ),
                          Expanded(
                            child: Text(
                              "Menyapaikan dalam bentuk tulisan hasil analisis peninggalan kerajaan Singhasari di"
                              " wilayah Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("4.1.3."),
                          ),
                          Expanded(
                            child: Text(
                              "Menyapaikan dalam bentuk tulisan hasil analisis peninggalan kerajaan Majapahit di wilayah Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Tujuan",
                  style: TextStyle(color: Color(0xff485696), fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("1."),
                          ),
                          Expanded(
                            child: Text(
                              "Melalui pengamatan di Aplikasi PETRUK siswa dapat mengetahui persebaran peninggalan Hindu Budha di Kabupaten dan Kota Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("2."),
                          ),
                          Expanded(
                            child: Text(
                              "Melalui Aplikasi PETRUKK yang diberikan, siswa dapat menjelaskan 2 peninggalanan Kerajaan Kediri di Kabupaten Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("3."),
                          ),
                          Expanded(
                            child: Text(
                              "Melalui Aplikasi PETRUKK yang diberikan, siswa dapat menjelaskan 2 peninggalanan Kerajaan Singhasari di Kabupaten Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text("4."),
                          ),
                          Expanded(
                            child: Text(
                              "Melalui Aplikasi PETRUKK yang diberikan, siswa dapat menjelaskan 2 peninggalanan Kerajaan Majapahit di Kabupaten Kediri.",
                              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
