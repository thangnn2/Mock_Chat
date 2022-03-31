import '../../model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MessageRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  var uuid = Uuid();
  List<dynamic>? getListMessage({List<dynamic>? list = const []}) {
    return list;
  }
  
  void addMessage({MessageModel? message, String? userId}) async {
    var data = {
      "userId": message?.userId,
      "content": message?.message,
      "date": DateTime.now().toUtc(),
    };
    await fireStore.collection("users").doc(userId).collection("message").doc(uuid.v4()).set(data);
  }

  // void lastMessageSent() {
  //   final
  // }
}
