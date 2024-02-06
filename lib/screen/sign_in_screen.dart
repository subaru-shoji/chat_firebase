import 'package:chat_firebase/gateway/auth_gateway.dart';
import 'package:chat_firebase/presenter/current_user_presenter.dart';
import 'package:chat_firebase/route/route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(signInScreenPresenterProvider);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                ref.read(signInScreenPresenterProvider.notifier).update(value);
              },
            ),
            TextButton(
              child: const Text('sign in'),
              onPressed: () async {
                await ref.read(signInScreenPresenterProvider.notifier).signIn();
                await ref.read(currentUserPresenterProvider.notifier).load();
                const ChatRoomListRoute().go(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignInScreenPresenter extends StateNotifier<String> {
  SignInScreenPresenter(this.authGateway) : super("");

  final AuthGateway authGateway;

  Future<void> signIn() async {
    await authGateway.signIn(state);
  }

  void update(String userName) {
    state = userName;
  }
}

final signInScreenPresenterProvider =
    StateNotifierProvider.autoDispose<SignInScreenPresenter, String>(
  (ref) => SignInScreenPresenter(
    ref.watch(authGatewayProvider),
  ),
);
