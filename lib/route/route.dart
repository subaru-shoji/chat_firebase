import 'package:chat_firebase/screen/chat_room_list_screen.dart';
import 'package:chat_firebase/screen/chat_room_screen.dart';
import 'package:chat_firebase/screen/home_screen.dart';
import 'package:chat_firebase/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: "/",
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SignInRoute>(
      path: "sign_in",
    ),
    TypedGoRoute<ChatRoomListRoute>(
      path: "chat_rooms",
    ),
    TypedGoRoute<ChatRoomRoute>(
      path: "chat_rooms/:id",
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context) => const HomeScreen();
}

class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context) => const SignInScreen();
}

class ChatRoomListRoute extends GoRouteData {
  const ChatRoomListRoute();

  @override
  Widget build(BuildContext context) => const ChatRoomListScreen();
}

class ChatRoomRoute extends GoRouteData {
  const ChatRoomRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context) => ChatRoomScreen(chatRoomId: id);
}
