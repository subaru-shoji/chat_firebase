import 'package:chat_firebase/entity/message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageGateway {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> send(String chatRoomId, Message message) async {
    firestore
        .collection("chat_room_collection")
        .doc(chatRoomId)
        .collection("message_collection")
        .add(message.toJson());
  }

  Stream<List<Message>> subscribeMessageList(String chatRoomId) {
    return firestore
        .collection("chat_room_collection")
        .doc(chatRoomId)
        .collection("message_collection")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((messageSnapshow) => Message.fromJson(messageSnapshow.data()))
            .toList());
  }
}

final messageGatewayProvider = Provider((ref) => MessageGateway());
