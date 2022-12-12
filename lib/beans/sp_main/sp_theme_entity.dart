import 'dart:convert';

import 'package:sp_demo/generated/json/base/json_field.dart';
import 'package:sp_demo/generated/json/sp_theme_entity.g.dart';

@JsonSerializable()
class SpThemeEntity {
  int? code;
  String? msg;
  SpThemeData? data;

  SpThemeEntity();

  factory SpThemeEntity.fromJson(Map<String, dynamic> json) => $SpThemeEntityFromJson(json);

  Map<String, dynamic> toJson() => $SpThemeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpThemeData {
  @JSONField(name: "data_list")
  List<SpThemeDataDataList>? dataList;

  SpThemeData();

  factory SpThemeData.fromJson(Map<String, dynamic> json) => $SpThemeDataFromJson(json);

  Map<String, dynamic> toJson() => $SpThemeDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpThemeDataDataList {
  @JSONField(name: "record_id")
  String? recordId;
  String? thumbnail;
  String? title;
  @JSONField(name: "has_sha_pan")
  bool? hasShaPan;
  @JSONField(name: "records_count")
  int? recordsCount;
  @JSONField(name: "theme_info")
  SpThemeDataDataListThemeInfo? themeInfo;

  SpThemeDataDataList();

  factory SpThemeDataDataList.fromJson(Map<String, dynamic> json) => $SpThemeDataDataListFromJson(json);

  Map<String, dynamic> toJson() => $SpThemeDataDataListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpThemeDataDataListThemeInfo {
  int? id;
  String? name;
  List<SpThemeDataDataListThemeInfoIntroduce>? introduce;

  SpThemeDataDataListThemeInfo();

  factory SpThemeDataDataListThemeInfo.fromJson(Map<String, dynamic> json) =>
      $SpThemeDataDataListThemeInfoFromJson(json);

  Map<String, dynamic> toJson() => $SpThemeDataDataListThemeInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpThemeDataDataListThemeInfoIntroduce {
  String? title;
  String? content;

  SpThemeDataDataListThemeInfoIntroduce();

  factory SpThemeDataDataListThemeInfoIntroduce.fromJson(Map<String, dynamic> json) =>
      $SpThemeDataDataListThemeInfoIntroduceFromJson(json);

  Map<String, dynamic> toJson() => $SpThemeDataDataListThemeInfoIntroduceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
