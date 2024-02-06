import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'user.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'current_user.freezed.dart';

@freezed
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required User user,
  }) = _CurrentUser;
}