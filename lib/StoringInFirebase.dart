import 'package:cloud_firestore/cloud_firestore.dart';

class StoreData {
  Future addUserDetail(Map<String, dynamic> userInfo, String Email) {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(Email)
        .set(userInfo);
  }

  Future<Map<String, dynamic>?> getUserDetail(String Email) async {

    DocumentSnapshot document = await FirebaseFirestore.instance.collection('user').doc(Email).get();

    if (document.exists) {
      return document.data() as Map<String, dynamic>;
    }
     return null;// Return null if the document does not exist
  }
}
