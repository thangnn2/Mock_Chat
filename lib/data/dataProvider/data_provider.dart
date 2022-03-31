import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_project/data/repository/message_repo.dart';

class DataProvider {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final MessageRepo? messageRepo = MessageRepo();

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>> messageList(
      {String? userId}) {
    return fireStore
        .collection("users")
        .doc(userId)
        .collection("message")
        .snapshots()
        .listen((listMessage) {
        messageRepo?.getListMessage(list: listMessage.docChanges);
    });
  }

  // StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> getUserLastUpdateMessage(
  //     {String? userId}) {
  //   return fireStore
  //       .collection("users")
  //       .doc(userId)
  //       .snapshots()
  //       .listen((listMessage) {
  //     messageRepo?.getListMessage(list: listMessage.data());
  //   });
  // }
}
