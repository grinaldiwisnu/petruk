class QuestionModel {
  String GAMBAR;
  String PERTANYAAN;
  List<String> PILIHAN;
  String PEMBAHASAN;
  String JAWABAN;

  QuestionModel({this.GAMBAR, this.PERTANYAAN, this.PILIHAN, this.PEMBAHASAN, this.JAWABAN});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    GAMBAR = json['GAMBAR'];
    PERTANYAAN = json['PERTANYAAN'];
    PILIHAN = json['PILIHAN'].cast<String>();
    PEMBAHASAN = json['PEMBAHASAN'];
    JAWABAN = json['JAWABAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GAMBAR'] = this.GAMBAR;
    data['PERTANYAAN'] = this.PERTANYAAN;
    data['PILIHAN'] = this.PILIHAN;
    data['PEMBAHASAN'] = this.PEMBAHASAN;
    data['JAWABAN'] = this.JAWABAN;
    return data;
  }
}
