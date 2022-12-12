import 'package:sp_demo/beans/sp_main/sp_theme_entity.dart';
import 'package:sp_demo/generated/json/base/json_convert_content.dart';

SpThemeEntity $SpThemeEntityFromJson(Map<String, dynamic> json) {
  final SpThemeEntity spThemeEntity = SpThemeEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    spThemeEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    spThemeEntity.msg = msg;
  }
  final SpThemeData? data = jsonConvert.convert<SpThemeData>(json['data']);
  if (data != null) {
    spThemeEntity.data = data;
  }
  return spThemeEntity;
}

Map<String, dynamic> $SpThemeEntityToJson(SpThemeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  return data;
}

SpThemeData $SpThemeDataFromJson(Map<String, dynamic> json) {
  final SpThemeData spThemeData = SpThemeData();
  final List<SpThemeDataDataList>? dataList = jsonConvert.convertListNotNull<SpThemeDataDataList>(json['data_list']);
  if (dataList != null) {
    spThemeData.dataList = dataList;
  }
  return spThemeData;
}

Map<String, dynamic> $SpThemeDataToJson(SpThemeData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data_list'] = entity.dataList?.map((v) => v.toJson()).toList();
  return data;
}

SpThemeDataDataList $SpThemeDataDataListFromJson(Map<String, dynamic> json) {
  final SpThemeDataDataList spThemeDataDataList = SpThemeDataDataList();
  final String? recordId = jsonConvert.convert<String>(json['record_id']);
  if (recordId != null) {
    spThemeDataDataList.recordId = recordId;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    spThemeDataDataList.thumbnail = thumbnail;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    spThemeDataDataList.title = title;
  }
  final bool? hasShaPan = jsonConvert.convert<bool>(json['has_sha_pan']);
  if (hasShaPan != null) {
    spThemeDataDataList.hasShaPan = hasShaPan;
  }
  final int? recordsCount = jsonConvert.convert<int>(json['records_count']);
  if (recordsCount != null) {
    spThemeDataDataList.recordsCount = recordsCount;
  }
  final SpThemeDataDataListThemeInfo? themeInfo = jsonConvert.convert<SpThemeDataDataListThemeInfo>(json['theme_info']);
  if (themeInfo != null) {
    spThemeDataDataList.themeInfo = themeInfo;
  }
  return spThemeDataDataList;
}

Map<String, dynamic> $SpThemeDataDataListToJson(SpThemeDataDataList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['record_id'] = entity.recordId;
  data['thumbnail'] = entity.thumbnail;
  data['title'] = entity.title;
  data['has_sha_pan'] = entity.hasShaPan;
  data['records_count'] = entity.recordsCount;
  data['theme_info'] = entity.themeInfo?.toJson();
  return data;
}

SpThemeDataDataListThemeInfo $SpThemeDataDataListThemeInfoFromJson(Map<String, dynamic> json) {
  final SpThemeDataDataListThemeInfo spThemeDataDataListThemeInfo = SpThemeDataDataListThemeInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    spThemeDataDataListThemeInfo.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    spThemeDataDataListThemeInfo.name = name;
  }
  final List<SpThemeDataDataListThemeInfoIntroduce>? introduce =
      jsonConvert.convertListNotNull<SpThemeDataDataListThemeInfoIntroduce>(json['introduce']);
  if (introduce != null) {
    spThemeDataDataListThemeInfo.introduce = introduce;
  }
  return spThemeDataDataListThemeInfo;
}

Map<String, dynamic> $SpThemeDataDataListThemeInfoToJson(SpThemeDataDataListThemeInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['introduce'] = entity.introduce?.map((v) => v.toJson()).toList();
  return data;
}

SpThemeDataDataListThemeInfoIntroduce $SpThemeDataDataListThemeInfoIntroduceFromJson(Map<String, dynamic> json) {
  final SpThemeDataDataListThemeInfoIntroduce spThemeDataDataListThemeInfoIntroduce =
      SpThemeDataDataListThemeInfoIntroduce();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    spThemeDataDataListThemeInfoIntroduce.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    spThemeDataDataListThemeInfoIntroduce.content = content;
  }
  return spThemeDataDataListThemeInfoIntroduce;
}

Map<String, dynamic> $SpThemeDataDataListThemeInfoIntroduceToJson(SpThemeDataDataListThemeInfoIntroduce entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['content'] = entity.content;
  return data;
}
