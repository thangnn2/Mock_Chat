import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';


class UserRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var uuid = Uuid();

  Future<void> updateUserData({String? email ,String? name, String? userId}) async {
      var data = {
        "email": email,
        "userId": userId,
        "name": name
      };
      await firestore.collection("users").doc(uuid.v4()).set(data);
  }
}