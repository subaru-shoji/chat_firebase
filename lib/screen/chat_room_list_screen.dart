import 'package:chat_firebase/entity/chat_room.dart';
import 'package:chat_firebase/gateway/chat_room_gateway.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatRoomListScreen extends HookConsumerWidget {
  const ChatRoomListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatRoomListScreenPresenterProvider);

    useEffect(() {
      ref.read(chatRoomListScreenPresenterProvider.notifier).load();

      return () {};
    }, []);

    return Scaffold(
      body: Center(
        child: Column(
          children: state
              .map(
                (chatRoom) => TextButton(
                  onPressed: () {},
                  child: Text(chatRoom.chatRoomName),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await showDialog(
            builder: (context) => const AddChatRoomDialog(), context: context);
      }),
    );
  }
}

class AddChatRoomDialog extends HookConsumerWidget {
  const AddChatRoomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomNameState = useState("");

    return AlertDialog(
      title: const Text("Add chat room."),
      content: TextFormField(onChanged: (value) {
        chatRoomNameState.value = value;
      }),
      actions: [
        TextButton(
          child: const Text("cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("ok"),
          onPressed: () async {
            await ref
                .read(chatRoomListScreenPresenterProvider.notifier)
                .add(chatRoomNameState.value);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('created.'),
            ));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class ChatRoomListScreenPresenter extends StateNotifier<List<ChatRoom>> {
  ChatRoomListScreenPresenter(this.chatRoomGateway) : super([]);

  final ChatRoomGateway chatRoomGateway;

  Future<void> load() async {
    state = await chatRoomGateway.getChatRoomList();
  }

  Future<void> add(String chatRoomName) async {
    await chatRoomGateway.save(ChatRoom(chatRoomName: chatRoomName));
  }
}

final chatRoomListScreenPresenterProvider = StateNotifierProvider.autoDispose<
    ChatRoomListScreenPresenter, List<ChatRoom>>(
  (ref) => ChatRoomListScreenPresenter(
    ref.watch(chatRoomGatewayProvider),
  ),
);
