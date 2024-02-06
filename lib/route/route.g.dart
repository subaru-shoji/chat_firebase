// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRoute,
    ];

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'sign_in',
          factory: $SignInRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'chat_rooms',
          factory: $ChatRoomListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'chat_rooms/:id',
          factory: $ChatRoomRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => const SignInRoute();

  String get location => GoRouteData.$location(
        '/sign_in',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $ChatRoomListRouteExtension on ChatRoomListRoute {
  static ChatRoomListRoute _fromState(GoRouterState state) =>
      const ChatRoomListRoute();

  String get location => GoRouteData.$location(
        '/chat_rooms',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $ChatRoomRouteExtension on ChatRoomRoute {
  static ChatRoomRoute _fromState(GoRouterState state) => ChatRoomRoute(
        state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/chat_rooms/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}
