import 'package:sp_demo/generated/json/base/json_convert_content.dart';
import 'package:sp_demo/beans/token_entity.dart';

TokenEntity $TokenEntityFromJson(Map<String, dynamic> json) {
	final TokenEntity tokenEntity = TokenEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		tokenEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		tokenEntity.msg = msg;
	}
	final TokenData? data = jsonConvert.convert<TokenData>(json['data']);
	if (data != null) {
		tokenEntity.data = data;
	}
	return tokenEntity;
}

Map<String, dynamic> $TokenEntityToJson(TokenEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

TokenData $TokenDataFromJson(Map<String, dynamic> json) {
	final TokenData tokenData = TokenData();
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		tokenData.token = token;
	}
	final String? secret = jsonConvert.convert<String>(json['secret']);
	if (secret != null) {
		tokenData.secret = secret;
	}
	return tokenData;
}

Map<String, dynamic> $TokenDataToJson(TokenData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['token'] = entity.token;
	data['secret'] = entity.secret;
	return data;
}