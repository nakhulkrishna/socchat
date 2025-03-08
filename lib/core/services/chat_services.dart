import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socchat/core/models/message_model.dart';

class ChatServices {
  final _fire = FirebaseFirestore.instance;

  saveMessage(Map<String, dynamic> message, String chatRoomId) async {
    try {
      await _fire
          .collection("chatRooms")
          .doc(chatRoomId)
          .collection("messages")
          .add(message);
    } catch (e) {}
  }

  updateLastMessage(String currentUid, String receviceruid, int DateTime,
      String message) async {
    try {
      await _fire.collection("users").doc(currentUid).update({
        "lastMessages": {
          "content": message,
          "timestamp": DateTime,
          "senderId": currentUid,
        }
      });

      await _fire.collection("users").doc(receviceruid).update({
        "lastMessages": {
          "content": message,
          "timestamp": DateTime,
          "senderId": currentUid,
        }
      });
    } catch (e) {}
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessags(String chatRoomId) {
    return _fire
        .collection("chatRooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
