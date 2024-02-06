// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthGateway {
  Future<void> signIn(String userName) async {
    window.sessionStorage["uasr_name"] = userName;
  }

  Future<String?> getUserName() async {
    return window.sessionStorage["uasr_name"];
  }
}

final authGatewayProvider = Provider((ref) => AuthGateway());
