import 'package:get/get.dart';
import 'package:sp_demo/beans/sp_main/sp_history_entity.dart';
import 'package:sp_demo/beans/sp_main/sp_theme_entity.dart';
import 'package:sp_demo/net/apis.dart';
import 'package:sp_demo/pages/sp_module/record_list/record_list_state.dart';
import 'package:sp_demo/pages/sp_module/theme_list/theme_list_logic.dart';

class RecordListLogic extends GetxController {
  final RecordListState state = RecordListState();

  void changeChooseRecordText(SpThemeDataDataList chooseRecordText) {
    // 更新数据
    if (chooseRecordText.themeInfo?.id == ThemeNum.selfNum) {
      state.chooseNum = 0;
    } else if (chooseRecordText.themeInfo?.id == ThemeNum.qinMiNum) {
      state.chooseNum = 1;
    } else if (chooseRecordText.themeInfo?.id == ThemeNum.zhiYeNum) {
      state.chooseNum = 2;
    }
    _getDefaultSp(chooseRecordText.themeInfo?.id ?? 0);

    update();
  }

  @override
  void onReady() async {
    // 根据idNum请求数据
    int idNum = state.idNum;
    if (idNum == -1) {
      // 不是从主题列表跳转过来的
      // 请求接口 先请求主题列表,再请求其他
      ResponseModel? result = await SpMainApis.getSpTheme(params: {});
      state.spThemeData = SpThemeData.fromJson(result?.data);

      _getDefaultSp(ThemeNum.selfNum, fromTheme: false);
    } else {
      _getDefaultSp(idNum, fromTheme: true);
    }
    super.onReady();
  }

  void _getDefaultSp(int idNum, {bool fromTheme = false}) async {
    // 请求接口
    Map<String, dynamic> params = {};
    params['page'] = 1;
    params['page_size'] = 100;
    params['theme_id'] = idNum;
    ResponseModel? result = await SpMainApis.getSpHistory(params: params);
    state.spHistoryData = SpHistoryData.fromJson(result?.data);
    if (fromTheme) {
      state.spThemeData = Get.find<ThemeListLogic>().state.spThemeData;
    }
    if (idNum == ThemeNum.selfNum) {
      state.chooseNum = 0;
    } else if (idNum == ThemeNum.qinMiNum) {
      state.chooseNum = 1;
    } else if (idNum == ThemeNum.zhiYeNum) {
      state.chooseNum = 2;
    }
    update();
  }
}
