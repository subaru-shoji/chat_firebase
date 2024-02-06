import 'package:chat_firebase/entity/current_user.dart';
import 'package:chat_firebase/entity/user.dart';
import 'package:chat_firebase/gateway/auth_gateway.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentUserPresenter extends StateNotifier<CurrentUser> {
  CurrentUserPresenter(this.authGateway)
      : super(const CurrentUser(user: User(userName: "")));

  final AuthGateway authGateway;

  Future<void> load() async {
    final userName = await authGateway.getUserName() ?? "";
    state = CurrentUser(user: User(userName: userName));
  }
}

final currentUserPresenterProvider =
    StateNotifierProvider<CurrentUserPresenter, CurrentUser>(
        (ref) => CurrentUserPresenter(ref.watch(authGatewayProvider)));
