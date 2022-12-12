import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as MFormData;
import 'package:dio/src/response.dart' as MRespons;
import 'package:sp_demo/utils/log.dart';
import 'package:sp_demo/utils/package_util.dart';
import 'package:sp_demo/utils/sort_util.dart';
import 'package:sp_demo/utils/sq_toast.dart';
import 'package:sp_demo/utils/string_util.dart';
import 'package:sp_demo/whole/whole_data.dart';

class Services {
  // 连接超时时间
  static const int CONNECT_TIMEOUT = 30000;

  // 根据特定的code来进行逻辑判断，进行兜底策略
  static const List<int> errorList = [
    10101, //10101，代表考试结果被删除，需要兜底
  ];

  // 接收超时时间
  static const int RECEIVE_TIMEOUT = 30000;

  static Services _instance = Services._internal();

  factory Services() => _instance;

  Dio? dio;

  Services._internal() {
    if (dio != null) return;
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      baseUrl: "https://testopenpsy.cece.com",
      headers: {},
    );

    dio = Dio(baseOptions);
    dio?.interceptors.add(
      // https://testopenpsy.cece.com/island/sha_pan/sha_pan_theme?app_id=app4dfaa4c545158&version=1.0.0&timestamp=1668750338835&nonce=Wgsqz4RfUKYsnX0NfWL4vYxloIWxiAS6&platform=android&token=bda33e1566a14f4d9a51909b515281d1&sign=bf5e05ad8436a840648f4cf8f8c26d45
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // _handleDataOrParams(data: {}, handleType: HandleType.post)
          if (options.method == "POST") {
            // options.headers.addAll({
            //   "app_id": WholeData().appId,
            //   "version": "${PackageUtil.packageInfo?.version}",
            //   "timestamp": DateTime.now().millisecondsSinceEpoch,
            //   "nonce": StringUtil.generateRandomString(32),
            //   "token": WholeData().tokenData?.token ?? "",
            //   "sign": options.data['sign'],
            //   "platform": "android",
            // });
          }

          yqLog(
              "请求前的options = ${options.data}  path= ${options.path} uri = ${options.uri}  headers = ${options.headers}",
              StackTrace.current);
          // Do something before request is sent
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse: (response, handler) {
          if (response.data['code'] != 0) {
            SQToast.show(response.data['msg']);
          }
          yqLog("response = $response", StackTrace.current);
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError e, handler) {
          yqLog("error", StackTrace.current);
          // Do something with response error
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        },
      ),
    );
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    params = _handleDataOrParams(data: params, handleType: HandleType.get);
    return dio
        ?.get(
          path,
          queryParameters: params,
          options: requestOptions,
        )
        .then((MRespons.Response value) => value.data)
        .catchError(
      (error) {
        SQToast.show(error.response.toString());
        if (null == error.response) return;
      },
    );
  }

  Future post(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    data,
  }) async {
    Options requestOptions = options ?? Options();
    data = _handleDataOrParams(data: data, handleType: HandleType.post);
    return dio
        ?.post(
          path,
          // data: data,
          queryParameters: data,
          options: requestOptions,
        )
        .then((MRespons.Response value) => value.data)
        .catchError(
      (error) {
        SQToast.show(error.response?.data?.toString() ?? "");
        yqLog("错误信息是 $error", StackTrace.current);
      },
    );
  }

  Map<String, dynamic> _handleDataOrParams(
      {required dynamic data, required HandleType handleType}) {
    Map<String, dynamic> baseData = {};
    if (data is Map<String, dynamic>) {
      baseData.addAll(data);
      Map<String, dynamic> baseMap = {
        "app_id": WholeData().appId,
        "version": "${PackageUtil.packageInfo?.version}",
        "timestamp": DateTime.now().millisecondsSinceEpoch,
        "nonce": StringUtil.generateRandomString(32),
        "platform": Platform.operatingSystem,
        "token": WholeData().tokenData?.token ?? "",
      };

      Map<String, dynamic> sinceMap = {};
      if (data.isNotEmpty && handleType != HandleType.post) {
        sinceMap.addAll(data);
      }

      if (data.isNotEmpty && handleType == HandleType.post) {
        // Map<String, dynamic> sinceMap = {};
        sinceMap['body'] = json.encode(data); // 加入传来的参数 拼body
      }
      sinceMap.addAll(baseMap);
      // 对数据排序
      Map<String, dynamic> newSinceMap = SortUtil.keySort(sinceMap);
      String sinceStr = StringUtil.getUrlParamsByMap(newSinceMap);
      sinceStr = "$sinceStr${WholeData().tokenData?.secret}";

      data.addAll(baseMap);
      data['sign'] = StringUtil.generateMD5(sinceStr);
      yqLog("data = $data", StackTrace.current);
      return data;
    } else {
      return {};
    }
  }

  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    return dio?.post(
      path,
      data: MFormData.FormData.fromMap(params ?? {}),
      options: requestOptions,
    );
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
  dynamic? data;

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

enum HandleType {
  get,
  post,
}
