import 'package:chat_firebase/entity/message.dart';
import 'package:chat_firebase/gateway/message_gateway.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatRoomScreen extends HookConsumerWidget {
  const ChatRoomScreen({
    Key? key,
    required this.chatRoomId,
  }) : super(key: key);

  final String chatRoomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatRoomScreenPrestenterProvider(chatRoomId));

    final sendTextFieldController = useTextEditingController();

    return Scaffold(
      body: Text(
        state.length.toString(),
      ),
      bottomNavigationBar: Row(children: [
        TextFormField(controller: sendTextFieldController),
        OutlinedButton(
          child: const Text("send"),
          onPressed: () async {
            await ref
                .read(chatRoomScreenPrestenterProvider(chatRoomId).notifier)
                .send(sendTextFieldController.text);
            sendTextFieldController.clear();
          },
        ),
      ]),
    );
  }
}

class ChatRoomScreenPresenter extends StateNotifier<List<Message>> {
  ChatRoomScreenPresenter({
    required this.chatRoomId,
    required this.messageGateway,
  }) : super([]);

  final String chatRoomId;
  final MessageGateway messageGateway;

  Future<void> send(String text) async {}
}

final chatRoomScreenPrestenterProvider = StateNotifierProvider.autoDispose
    .family<ChatRoomScreenPresenter, List<Message>, String>(
  (ref, chatRoomId) => ChatRoomScreenPresenter(
    chatRoomId: chatRoomId,
    messageGateway: ref.watch(messageGatewayProvider),
  ),
);
