import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petruk/model/photo_model.dart';

class LocationModel {
  String DIKUNJUNGI;
  String DESKRIPSI;
  String LOKASI;
  String NAMA;
  String VIDEO;
  String FILE;
  GeoPoint KOORDINAT;
  String PETA;
  List<PhotoModel> PHOTO;

  LocationModel(
      {this.DIKUNJUNGI,
      this.DESKRIPSI,
      this.LOKASI,
      this.NAMA,
      this.VIDEO,
      this.FILE,
      this.KOORDINAT,
      this.PETA,
      this.PHOTO});

  Map<String, dynamic> toMap() {
    return {
      'DIKUNJUNGI': this.DIKUNJUNGI,
      'DESKRIPSI': this.DESKRIPSI,
      'LOKASI': this.LOKASI,
      'NAMA': this.NAMA,
      'VIDEO': this.VIDEO,
      'FILE': this.FILE,
      'KOORDINAT': this.KOORDINAT,
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
      FILE: map['FILE'] as String,
      KOORDINAT: map['KOORDINAT'] as GeoPoint,
      PETA: map['PETA'] as String,
      PHOTO: map['PHOTO'] as List<PhotoModel>,
    );
  }
}
