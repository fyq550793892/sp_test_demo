import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:sp_demo/net/apis.dart';
import 'package:sp_demo/pages/sp_module/sp_main/sp_main_logic.dart';
import 'package:sp_demo/utils/common.dart';
import 'package:sp_demo/whole/whole_data.dart';

/**
* Author: fanyuqing
* Date: 7/26/22
* Description: 字符串工具类
*/

class StringUtil {
  // 获取图片资源 picName:图片名称
  static String getAssets(String picName) {
    return "assets/images/3.0x/$picName";
  }

  /**
   * 将map转换成url
   */
  static String getUrlParamsByMap(Map<String, dynamic> map) {
    String mStr = "";
    map.forEach((key, value) {
      mStr = "$mStr$key=$value&";
    });
    return mStr.replaceRange(mStr.length - 1, mStr.length, "");
  }

  ///使用md5加密
  static String generateMD5(String data) {
    Uint8List content = new Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return digest.toString();
  }

  static String generateRandomString(int length) {
    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();

    return randomString;
  }

  static String handleData({
    String path = "/sha_pan?from=home",
    String extraData = "{}",
    bool isXydPage = false,
  }) {
    Map<String, dynamic> dataMap = {};
    dataMap['appId'] = WholeData().appId;
    dataMap['userId'] = WholeData().userId;
    dataMap['userToken'] = WholeData().tokenData?.token;
    dataMap['signSecret'] = WholeData().tokenData?.secret;
    dataMap['path'] = path;
    dataMap['extraData'] = extraData;
    dataMap['options'] = {};

    int timeSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    // _sendOpenEvent(timeSinceEpoch);
    if (Get.find<SpMainLogic>().state.controller.text.isNotEmpty) {
      Map<String, dynamic> mapText = {};
      if (json.decode(Get.find<SpMainLogic>().state.controller.text) is Map) {
        mapText = json.decode(Get.find<SpMainLogic>().state.controller.text);
        if (isXydPage) {
          dataMap['options']['ceceParams'] = {
            "baseUrl": "http://api-test.cece.com",
            "appSecret": "45f8c7f6eca9994ce5f13b754dced0f6",
            "appid": "cece",
            "vs": "9.19.1",
            "apikey": "efdeaf6a3798dbaf08b4f96c3d86c039",
            "client": "android",
            "agent": "andr.cc",
            "appType": "cece",
            "channel": "xxwolo",
            "deviceId": "01740d8ced7c8d4701a36243acea863d",
            "iosidfa": "16cd479e78f6d6ef",
            "brand": "HUAWEI",
            "model": "JER-AN20",
            "carrier": "",
            "lang": "zh-CN",
            "uuid": "6dafcf85-746d-3b35-8921-6da52d063684"
          };
        }
        dataMap['options']['autoMonitor'] = mapText['autoMonitor'];
        dataMap['options']['openReturnGesture'] = mapText['openReturnGesture'];
        dataMap['options']['onQuit'] = mapText['onQuit'];
        dataMap['options']['openTimestamp'] = timeSinceEpoch;
      }
    } else {
      if (isXydPage) {
        dataMap['options']['ceceParams'] = {
          "baseUrl": "http://api-test.cece.com",
          "appSecret": "45f8c7f6eca9994ce5f13b754dced0f6",
          "appid": "cece",
          "vs": "9.19.1",
          "apikey": "efdeaf6a3798dbaf08b4f96c3d86c039",
          "client": "android",
          "agent": "andr.cc",
          "appType": "cece",
          "channel": "xxwolo",
          "deviceId": "01740d8ced7c8d4701a36243acea863d",
          "iosidfa": "16cd479e78f6d6ef",
          "brand": "HUAWEI",
          "model": "JER-AN20",
          "carrier": "",
          "lang": "zh-CN",
          "uuid": "6dafcf85-746d-3b35-8921-6da52d063684"
        };
      }
      dataMap['options']['autoMonitor'] = 0;
      dataMap['options']['openReturnGesture'] = true;
      dataMap['options']['onQuit'] = false;
      dataMap['options']['openTimestamp'] = timeSinceEpoch;
    }

    dataMap['options']['userAgent'] = Constant.userAgent;

    // 上报时间点
    return json.encode(dataMap);
  }

  static void _sendOpenEvent(int timeSinceEpoch) async {
    Map<String, dynamic> params = {};
    params['event'] = "open";
    params['content'] = timeSinceEpoch;
    await SpMainApis.postReport(params: params);
  }
}
