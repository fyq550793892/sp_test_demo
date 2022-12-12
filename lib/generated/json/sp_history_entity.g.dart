import 'package:sp_demo/beans/sp_main/sp_history_entity.dart';
import 'package:sp_demo/generated/json/base/json_convert_content.dart';

SpHistoryEntity $SpHistoryEntityFromJson(Map<String, dynamic> json) {
  final SpHistoryEntity spHistoryEntity = SpHistoryEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    spHistoryEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    spHistoryEntity.msg = msg;
  }
  final SpHistoryData? data = jsonConvert.convert<SpHistoryData>(json['data']);
  if (data != null) {
    spHistoryEntity.data = data;
  }
  return spHistoryEntity;
}

Map<String, dynamic> $SpHistoryEntityToJson(SpHistoryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  return data;
}

SpHistoryData $SpHistoryDataFromJson(Map<String, dynamic> json) {
  final SpHistoryData spHistoryData = SpHistoryData();
  final List<List>? records =
      jsonConvert.convertListNotNull<List>(json['records']);
  if (records != null) {
    spHistoryData.records = records;
  }
  return spHistoryData;
}

Map<String, dynamic> $SpHistoryDataToJson(SpHistoryData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['records'] = entity.records;
  return data;
}

SpHistoryDataRecordsSpHistoryDataRecords
    $SpHistoryDataRecordsSpHistoryDataRecordsFromJson(
        Map<String, dynamic> json) {
  final SpHistoryDataRecordsSpHistoryDataRecords
      spHistoryDataRecordsSpHistoryDataRecords =
      SpHistoryDataRecordsSpHistoryDataRecords();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    spHistoryDataRecordsSpHistoryDataRecords.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    spHistoryDataRecordsSpHistoryDataRecords.title = title;
  }
  final int? themeId = jsonConvert.convert<int>(json['theme_id']);
  if (themeId != null) {
    spHistoryDataRecordsSpHistoryDataRecords.themeId = themeId;
  }
  final bool? isDone = jsonConvert.convert<bool>(json['is_done']);
  if (isDone != null) {
    spHistoryDataRecordsSpHistoryDataRecords.isDone = isDone;
  }
  final String? lastVisit = jsonConvert.convert<String>(json['last_visit']);
  if (lastVisit != null) {
    spHistoryDataRecordsSpHistoryDataRecords.lastVisit = lastVisit;
  }
  final String? themeName = jsonConvert.convert<String>(json['theme_name']);
  if (themeName != null) {
    spHistoryDataRecordsSpHistoryDataRecords.themeName = themeName;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    spHistoryDataRecordsSpHistoryDataRecords.thumbnail = thumbnail;
  }
  final String? terrainName = jsonConvert.convert<String>(json['terrain_name']);
  if (terrainName != null) {
    spHistoryDataRecordsSpHistoryDataRecords.terrainName = terrainName;
  }
  final String? weather = jsonConvert.convert<String>(json['weather']);
  if (weather != null) {
    spHistoryDataRecordsSpHistoryDataRecords.weather = weather;
  }
  final String? weatherName = jsonConvert.convert<String>(json['weather_name']);
  if (weatherName != null) {
    spHistoryDataRecordsSpHistoryDataRecords.weatherName = weatherName;
  }
  final String? lastCameraPosition =
      jsonConvert.convert<String>(json['last_camera_position']);
  if (lastCameraPosition != null) {
    spHistoryDataRecordsSpHistoryDataRecords.lastCameraPosition =
        lastCameraPosition;
  }
  final String? note = jsonConvert.convert<String>(json['note']);
  if (note != null) {
    spHistoryDataRecordsSpHistoryDataRecords.note = note;
  }
  final bool? isConsultInLive =
      jsonConvert.convert<bool>(json['is_consult_in_live']);
  if (isConsultInLive != null) {
    spHistoryDataRecordsSpHistoryDataRecords.isConsultInLive = isConsultInLive;
  }
  final String? createAt = jsonConvert.convert<String>(json['create_at']);
  if (createAt != null) {
    spHistoryDataRecordsSpHistoryDataRecords.createAt = createAt;
  }
  return spHistoryDataRecordsSpHistoryDataRecords;
}

Map<String, dynamic> $SpHistoryDataRecordsSpHistoryDataRecordsToJson(
    SpHistoryDataRecordsSpHistoryDataRecords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['theme_id'] = entity.themeId;
  data['is_done'] = entity.isDone;
  data['last_visit'] = entity.lastVisit;
  data['theme_name'] = entity.themeName;
  data['thumbnail'] = entity.thumbnail;
  data['terrain_name'] = entity.terrainName;
  data['weather'] = entity.weather;
  data['weather_name'] = entity.weatherName;
  data['last_camera_position'] = entity.lastCameraPosition;
  data['note'] = entity.note;
  data['is_consult_in_live'] = entity.isConsultInLive;
  data['create_at'] = entity.createAt;
  return data;
}
