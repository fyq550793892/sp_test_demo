import 'dart:convert';

import 'package:sp_demo/generated/json/base/json_field.dart';
import 'package:sp_demo/generated/json/message_entity.g.dart';

@JsonSerializable()
class MessageEntity {
  String? gameObject;
  String? methodName;
  String? message;

  MessageEntity();

  factory MessageEntity.fromJson(Map<String, dynamic> json) => $MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => $MessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
