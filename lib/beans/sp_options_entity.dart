import 'dart:convert';

import 'package:sp_demo/generated/json/base/json_field.dart';
import 'package:sp_demo/generated/json/sp_options_entity.g.dart';

@JsonSerializable()
class SpOptionsEntity {
  String? onQuit;
  String? onMessage;
  String? userAgent;
  int? autoMonitor;
  SpOptionsCeceParams? ceceParams;

  SpOptionsEntity();

  factory SpOptionsEntity.fromJson(Map<String, dynamic> json) => $SpOptionsEntityFromJson(json);

  Map<String, dynamic> toJson() => $SpOptionsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpOptionsCeceParams {
  String? param1;

  SpOptionsCeceParams();

  factory SpOptionsCeceParams.fromJson(Map<String, dynamic> json) => $SpOptionsCeceParamsFromJson(json);

  Map<String, dynamic> toJson() => $SpOptionsCeceParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
