class SitationModel {
  String RUJUKAN;

  SitationModel({this.RUJUKAN});

  factory SitationModel.fromMap(Map<String, dynamic> map) {
    return new SitationModel(
      RUJUKAN: map['RUJUKAN'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'RUJUKAN': this.RUJUKAN,
    } as Map<String, dynamic>;
  }
}
