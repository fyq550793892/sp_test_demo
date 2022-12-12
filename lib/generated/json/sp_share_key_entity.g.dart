import 'package:sp_demo/beans/sp_share_key_entity.dart';
import 'package:sp_demo/generated/json/base/json_convert_content.dart';

SpShareKeyEntity $SpShareKeyEntityFromJson(Map<String, dynamic> json) {
  final SpShareKeyEntity spShareKeyEntity = SpShareKeyEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    spShareKeyEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    spShareKeyEntity.msg = msg;
  }
  final SpShareKeyData? data =
      jsonConvert.convert<SpShareKeyData>(json['data']);
  if (data != null) {
    spShareKeyEntity.data = data;
  }
  return spShareKeyEntity;
}

Map<String, dynamic> $SpShareKeyEntityToJson(SpShareKeyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data.toJson();
  return data;
}

SpShareKeyData $SpShareKeyDataFromJson(Map<String, dynamic> json) {
  final SpShareKeyData spShareKeyData = SpShareKeyData();
  final String? shareKey = jsonConvert.convert<String>(json['share_key']);
  if (shareKey != null) {
    spShareKeyData.shareKey = shareKey;
  }
  return spShareKeyData;
}

Map<String, dynamic> $SpShareKeyDataToJson(SpShareKeyData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['share_key'] = entity.shareKey;
  return data;
}
