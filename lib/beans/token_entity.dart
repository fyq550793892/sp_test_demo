import 'package:sp_demo/generated/json/base/json_field.dart';
import 'package:sp_demo/generated/json/token_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TokenEntity {

	int? code;
	String? msg;
	TokenData? data;
  
  TokenEntity();

  factory TokenEntity.fromJson(Map<String, dynamic> json) => $TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => $TokenEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TokenData {

	String? token;
	String? secret;
  
  TokenData();

  factory TokenData.fromJson(Map<String, dynamic> json) => $TokenDataFromJson(json);

  Map<String, dynamic> toJson() => $TokenDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}