import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petruk/model/photo_model.dart';

class LocationModel {
  String DIKUNJUNGI;
  String DESKRIPSI;
  String LOKASI;
  String NAMA;
  String VIDEO;
  String KERAJAAN;
  String FILE;
  String FOTO;
  String TIPE;
  GeoPoint KOORDINAT;
  String DISPLAY;
  String IS_GROUP;
  String PETA;
  List<PhotoModel> PHOTO;

  LocationModel(
      {this.DIKUNJUNGI,
      this.DESKRIPSI,
      this.LOKASI,
      this.NAMA,
      this.VIDEO,
      this.KERAJAAN,
      this.FILE,
      this.FOTO,
      this.TIPE,
      this.KOORDINAT,
      this.DISPLAY,
      this.IS_GROUP,
      this.PETA,
      this.PHOTO});

  Map<String, dynamic> toMap() {
    return {
      'DIKUNJUNGI': this.DIKUNJUNGI,
      'DESKRIPSI': this.DESKRIPSI,
      'LOKASI': this.LOKASI,
      'NAMA': this.NAMA,
      'VIDEO': this.VIDEO,
      'KERAJAAN': this.KERAJAAN,
      'FILE': this.FILE,
      'FOTO': this.FOTO,
      'TIPE': this.TIPE,
      'KOORDINAT': this.KOORDINAT,
      'DISPLAY': this.DISPLAY,
      'IS_GROUP': this.IS_GROUP,
      'PETA': this.PETA,
      'PHOTO': this.PHOTO,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return new LocationModel(
      DIKUNJUNGI: map['DIKUNJUNGI'].toString(),
      DESKRIPSI: map['DESKRIPSI'] as String,
      LOKASI: map['LOKASI'] as String,
      NAMA: map['NAMA'] as String,
      VIDEO: map['VIDEO'] as String,
      KERAJAAN: map['KERAJAAN'] as String,
      FILE: map['FILE'] as String,
      FOTO: map['FOTO'] as String,
      TIPE: map['TIPE'].toString(),
      KOORDINAT: map['KOORDINAT'] as GeoPoint,
      DISPLAY: map['DISPLAY'].toString(),
      IS_GROUP: map['IS_GROUP'].toString(),
      PETA: map['PETA'] as String,
      PHOTO: map['PHOTO'] as List<PhotoModel>,
    );
  }
}
