import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    @JsonKey(ignore: true) String? id,
    required String chatRoomName,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, Object?> json) =>
      _$ChatRoomFromJson(json);
}
