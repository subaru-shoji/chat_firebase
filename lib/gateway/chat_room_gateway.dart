import 'package:chat_firebase/entity/chat_room.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomGateway {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> save(ChatRoom chatRoom) async {
    firestore
        .collection("chat_room_collection")
        .doc(chatRoom.id)
        .set(chatRoom.toJson());
  }

  Future<List<ChatRoom>> getChatRoomList() async {
    return (await firestore.collection("chat_room_collection").get())
        .docs
        .map((snapshot) => ChatRoom.fromJson(snapshot.data()))
        .toList();
  }
}

final chatRoomGatewayProvider = Provider((ref) => ChatRoomGateway());
