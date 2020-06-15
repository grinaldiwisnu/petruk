import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petruk/model/location_model.dart';
import 'package:petruk/model/photo_model.dart';
import 'package:petruk/model/question_model.dart';

class FirebaseLocationRepository {
  final todoCollection = Firestore.instance;

  Future<List<LocationModel>> locations() async {
    List<LocationModel> listLocation = List<LocationModel>();
    QuerySnapshot result = await todoCollection.collection('peninggalan').getDocuments();
    for (int i = 0; i < result.documents.length; i++) {
      QuerySnapshot photoResult = await todoCollection
          .collection('peninggalan')
          .document(result.documents[i].documentID)
          .collection('images')
          .getDocuments();
      List<PhotoModel> listPhoto = List<PhotoModel>();
      photoResult.documents.forEach((dataPhoto) {
        listPhoto.add(PhotoModel.fromMap(dataPhoto.data));
      });
      listLocation.add(LocationModel.fromMap(result.documents[i].data));
      listLocation[i].PHOTO = listPhoto;
    }

    return listLocation;
  }

  Future<List<QuestionModel>> evaluation() async {
    List<QuestionModel> listQuestion = List<QuestionModel>();
    QuerySnapshot result = await todoCollection.collection('soal').getDocuments();

    if (result.documents.length > 0) {
      result.documents.forEach((data) {
        listQuestion.add(QuestionModel.fromJson(data.data));
      });
      return listQuestion;
    } else {
      return listQuestion;
    }
  }
}
