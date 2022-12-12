import 'package:get/get.dart';
import 'package:sp_demo/beans/sp_main/sp_theme_entity.dart';
import 'package:sp_demo/beans/sp_share_key_entity.dart';
import 'package:sp_demo/net/apis.dart';
import 'package:sp_demo/utils/log.dart';

import 'theme_list_state.dart';

class ThemeListLogic extends GetxController {
  final ThemeListState state = ThemeListState();

  @override
  void onReady() async {
    ResponseModel? result = await SpMainApis.getSpTheme(params: {});
    state.spThemeData = SpThemeData.fromJson(result?.data);
    yqLog("这个是多少= ${state.spThemeData}", StackTrace.current);
    update();
    super.onReady();
  }

  void getShareKey(String recodeId, int idNum) async {
    Map<String, dynamic> params = Map();
    params['record_id'] = recodeId;
    params['theme_id'] = idNum;
    ResponseModel? result = await SpMainApis.getShareKey(params: params);
    state.spShareKeyData = SpShareKeyData.fromJson(result?.data);
    update();
  }
}
