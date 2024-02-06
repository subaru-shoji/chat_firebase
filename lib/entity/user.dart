import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String userName,
  }) = _User;
}
