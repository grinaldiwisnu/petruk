import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    listHelp(
                        icon: "assets/kikd.svg",
                        title: "Menu KI/KD",
                        text: "Berisi penjelasan Kompetensi Inti, Kompetensi Dasar, Indikator, dan Tujuan."),
                    listHelp(
                        icon: "assets/location.svg",
                        title: "Menu Peta",
                        text:
                            "Berisi peta lokasi peninggalan dan situs-situs sejarah di Kediri beserta materi setiap peninggalan."),
                    listHelp(
                        icon: "assets/evaluation.svg",
                        title: "Menu Evaluasi",
                        text: "Berisi soal-soal evaluasi berdasarkan materi yang telah dibaca di peta lokasi."),
                    listHelp(
                        icon: "assets/more.svg",
                        title: "Menu Daftar Pustaka",
                        text: "Berisi daftar rujukan materi-materi yang ada pada peta lokasi."),
                    listHelp(
                        icon: "assets/about.svg",
                        title: "Menu Tentang",
                        text: "Berisi informasi pengembang aplikasi PETRUK beserta kontak."),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  listStep(no: 1, step: "Klik button “Mulai Berpetualangan” untuk masuk menu utama."),
                  listStep(
                      no: 2,
                      step: "Klik menu KI dan KD  untuk mengetahui Kompetensi Inti, Kompetensi Dasar, "
                          "Indikator,dan Tujuan pembelajaran yang  ingin dicapai melalui aplikasi PETRUK."),
                  listStep(no: 3, step: "Klik menu Bantuan untuk mengetahui penggunaan aplikasi PETRUK."),
                  listStep(
                      no: 4,
                      step: "Klik menu PETA - klik ikon tanda tanya untuk mengetahui peta persebaran "
                          "Hindu Budha di wilayah Kediri – klik 2 kali ikon peninggalan Hindu Budha diwilayah Kediri – Pelajari menu materi, foto, dan video."),
                  listStep(
                      no: 5,
                      step: "klik menu evaluasi –klik button”Mulai Evaluasi”- baca dan jawab soal yang "
                          "tersedia - klik cek jawaban untuk mengetahui pembahasan soal – klik soal selanjutnya untuk melanjutkan soal."),
                  listStep(
                      no: 6,
                      step: "klik menu daftar pustaka untuk mengetahui rujukan yang digunakan dalam "
                          "pembuatan materi aplikasi PETRUK"),
                ],
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

  Widget listStep({String step, int no}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            child: Text("$no."),
          ),
          Expanded(
            child: Text(
              step,
              style: TextStyle(fontSize: 16, color: Color(0xff485696)),
            ),
          ),
        ],
      ),
    );
  }

  Widget listHelp({String icon, String title, String text}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                icon,
                height: 35,
                alignment: Alignment.center,
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, color: Color(0xff485696), fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16, color: Color(0xff485696)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
