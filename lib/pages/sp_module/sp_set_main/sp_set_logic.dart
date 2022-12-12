import 'dart:math';

import 'package:get/get.dart';
import 'package:sp_demo/beans/token_entity.dart';
import 'package:sp_demo/net/apis.dart';
import 'package:sp_demo/utils/log.dart';
import 'package:sp_demo/whole/whole_data.dart';

import 'sp_set_state.dart';

class SpSetLogic extends GetxController {
  final SpSetState state = SpSetState();

  @override
  void onReady() {
    super.onReady();
    getToken();
  }

  void getToken() async {
    Map<String, dynamic> params = Map();
    params['secret'] = WholeData().secretKey;
    params['user_id'] = WholeData().userId;

    var result = await SpMainApis.getToken(params: params);
    WholeData().tokenData = TokenData.fromJson(result['data']);
    yqLog("result = $result", StackTrace.current);
  }

  void changeSwitch(bool value) {
    state.openDebug = value;
    update();
  }

  // 修改为主播角色
  void changeUserForAnchor(bool changeAnchor) {
    state.changeAnchor = changeAnchor;
    update();
  }
}

String generateRandomString(int length) {
  final _random = Random();
  const _availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final randomString = List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();

  return randomString;
}
