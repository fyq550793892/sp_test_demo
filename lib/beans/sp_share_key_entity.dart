import 'dart:convert';

import 'package:sp_demo/generated/json/base/json_field.dart';
import 'package:sp_demo/generated/json/sp_share_key_entity.g.dart';

@JsonSerializable()
class SpShareKeyEntity {
  late int code;
  late String msg;
  late SpShareKeyData data;

  SpShareKeyEntity();

  factory SpShareKeyEntity.fromJson(Map<String, dynamic> json) =>
      $SpShareKeyEntityFromJson(json);

  Map<String, dynamic> toJson() => $SpShareKeyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpShareKeyData {
  @JSONField(name: "share_key")
  late String shareKey;

  SpShareKeyData();

  factory SpShareKeyData.fromJson(Map<String, dynamic> json) =>
      $SpShareKeyDataFromJson(json);

  Map<String, dynamic> toJson() => $SpShareKeyDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
