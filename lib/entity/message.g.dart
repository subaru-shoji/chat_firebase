// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      userName: json['userName'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      body: json['body'] as String,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'datetime': instance.datetime.toIso8601String(),
      'body': instance.body,
    };
