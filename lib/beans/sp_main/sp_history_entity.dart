import 'dart:convert';

import 'package:sp_demo/generated/json/base/json_field.dart';
import 'package:sp_demo/generated/json/sp_history_entity.g.dart';

@JsonSerializable()
class SpHistoryEntity {
  int? code;
  String? msg;
  SpHistoryData? data;

  SpHistoryEntity();

  factory SpHistoryEntity.fromJson(Map<String, dynamic> json) => $SpHistoryEntityFromJson(json);

  Map<String, dynamic> toJson() => $SpHistoryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpHistoryData {
  List<List>? records;

  SpHistoryData();

  factory SpHistoryData.fromJson(Map<String, dynamic> json) => $SpHistoryDataFromJson(json);

  Map<String, dynamic> toJson() => $SpHistoryDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpHistoryDataRecordsSpHistoryDataRecords {
  String? id;
  String? title;
  @JSONField(name: "theme_id")
  int? themeId;
  @JSONField(name: "is_done")
  bool? isDone;
  @JSONField(name: "last_visit")
  String? lastVisit;
  @JSONField(name: "theme_name")
  String? themeName;
  String? thumbnail;
  @JSONField(name: "terrain_name")
  String? terrainName;
  String? weather;
  @JSONField(name: "weather_name")
  String? weatherName;
  @JSONField(name: "last_camera_position")
  String? lastCameraPosition;
  String? note;
  @JSONField(name: "is_consult_in_live")
  bool? isConsultInLive;
  @JSONField(name: "create_at")
  String? createAt;

  SpHistoryDataRecordsSpHistoryDataRecords();

  factory SpHistoryDataRecordsSpHistoryDataRecords.fromJson(Map<String, dynamic> json) =>
      $SpHistoryDataRecordsSpHistoryDataRecordsFromJson(json);

  Map<String, dynamic> toJson() => $SpHistoryDataRecordsSpHistoryDataRecordsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
