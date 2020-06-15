class PhotoModel {
  String URL_FOTO;

  PhotoModel({this.URL_FOTO});

  Map<String, dynamic> toMap() {
    return {
      'URL_FOTO': this.URL_FOTO,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return new PhotoModel(
      URL_FOTO: map['URL_FOTO'] as String,
    );
  }
}
