import 'package:sp_demo/net/services.dart';

class SpMainApis {
  // 获取token
  static Future getToken({required Map<String, dynamic> params}) => Services().post('/island/token/get', data: params);

  // 获取沙盘主题列表
  static Future<ResponseModel?> getSpTheme({required Map<String, dynamic> params}) async {
    ResponseModel? responseModel;
    Map<String, dynamic> result = await Services().get("/island/sha_pan/sha_pan_theme", params: params);
    if (result['code'] == 0) {
      responseModel = ResponseModel.fromJson(result);
      return responseModel;
    } else {
      return null;
    }
  }

  // 获取历史列表
  static Future<ResponseModel?> getSpHistory({required Map<String, dynamic> params}) async {
    ResponseModel? responseModel;
    Map<String, dynamic> result = await Services().get("/island/sha_pan/snapshot_list", params: params);
    if (result['code'] == 0) {
      responseModel = ResponseModel.fromJson(result);
      return responseModel;
    } else {
      return null;
    }
  }

  // 上报open埋点
  static Future<ResponseModel?> postReport({required Map<String, dynamic> params}) async {
    ResponseModel? responseModel;
    Map<String, dynamic> result = await Services().post("/island/sensor_report/report", data: params);
    if (result['code'] == 0) {
      responseModel = ResponseModel.fromJson(result);
      return responseModel;
    } else {
      return null;
    }
  }
}

class ResponseModel {
  ResponseModel({
    this.code,
    this.msg,
    this.data,
  });

  int? code;
  String? msg;
  dynamic data;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
  }

  @override
  String toString() {
    return '\ncode:$code\nmsg:$msg\ndata:$data\n';
  }
}
