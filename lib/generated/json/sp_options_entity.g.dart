import 'package:sp_demo/generated/json/base/json_convert_content.dart';
import 'package:sp_demo/beans/sp_options_entity.dart';

SpOptionsEntity $SpOptionsEntityFromJson(Map<String, dynamic> json) {
	final SpOptionsEntity spOptionsEntity = SpOptionsEntity();
	final String? onQuit = jsonConvert.convert<String>(json['onQuit']);
	if (onQuit != null) {
		spOptionsEntity.onQuit = onQuit;
	}
	final String? onMessage = jsonConvert.convert<String>(json['onMessage']);
	if (onMessage != null) {
		spOptionsEntity.onMessage = onMessage;
	}
	final String? userAgent = jsonConvert.convert<String>(json['userAgent']);
	if (userAgent != null) {
		spOptionsEntity.userAgent = userAgent;
	}
	final int? autoMonitor = jsonConvert.convert<int>(json['autoMonitor']);
	if (autoMonitor != null) {
		spOptionsEntity.autoMonitor = autoMonitor;
	}
	final SpOptionsCeceParams? ceceParams = jsonConvert.convert<SpOptionsCeceParams>(json['ceceParams']);
	if (ceceParams != null) {
		spOptionsEntity.ceceParams = ceceParams;
	}
	return spOptionsEntity;
}

Map<String, dynamic> $SpOptionsEntityToJson(SpOptionsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['onQuit'] = entity.onQuit;
	data['onMessage'] = entity.onMessage;
	data['userAgent'] = entity.userAgent;
	data['autoMonitor'] = entity.autoMonitor;
	data['ceceParams'] = entity.ceceParams?.toJson();
	return data;
}

SpOptionsCeceParams $SpOptionsCeceParamsFromJson(Map<String, dynamic> json) {
	final SpOptionsCeceParams spOptionsCeceParams = SpOptionsCeceParams();
	final String? param1 = jsonConvert.convert<String>(json['param1']);
	if (param1 != null) {
		spOptionsCeceParams.param1 = param1;
	}
	return spOptionsCeceParams;
}

Map<String, dynamic> $SpOptionsCeceParamsToJson(SpOptionsCeceParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['param1'] = entity.param1;
	return data;
}