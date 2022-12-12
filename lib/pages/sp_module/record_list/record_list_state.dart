import 'package:get/get.dart';
import 'package:sp_demo/beans/sp_main/sp_history_entity.dart';
import 'package:sp_demo/beans/sp_main/sp_theme_entity.dart';

class ThemeNum {
  static const int selfNum = 2;
  static const int qinMiNum = 3;
  static const int zhiYeNum = 19;
}

class RecordListState {
  int idNum = -1;

  SpHistoryData? spHistoryData;

  SpThemeData? spThemeData;

  int chooseNum = 0;

  RecordListState() {
    idNum = Get.arguments ?? -1;
  }
}
