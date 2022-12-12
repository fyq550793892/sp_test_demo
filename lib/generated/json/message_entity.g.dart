import 'package:sp_demo/beans/sp_main/message_entity.dart';
import 'package:sp_demo/generated/json/base/json_convert_content.dart';

MessageEntity $MessageEntityFromJson(Map<String, dynamic> json) {
  final MessageEntity messageEntity = MessageEntity();
  final String? gameObject = jsonConvert.convert<String>(json['gameObject']);
  if (gameObject != null) {
    messageEntity.gameObject = gameObject;
  }
  final String? methodName = jsonConvert.convert<String>(json['methodName']);
  if (methodName != null) {
    messageEntity.methodName = methodName;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    messageEntity.message = message;
  }
  return messageEntity;
}

Map<String, dynamic> $MessageEntityToJson(MessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameObject'] = entity.gameObject;
  data['methodName'] = entity.methodName;
  data['message'] = entity.message;
  return data;
}
