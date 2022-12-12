import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sp_demo/pages/my_home_page.dart';
import 'package:sp_demo/pages/sp_module/live_sp/live_sp_view.dart';
import 'package:sp_demo/pages/sp_module/live_sp_join/live_sp_join_view.dart';
import 'package:sp_demo/pages/sp_module/record_list/record_list_view.dart';
import 'package:sp_demo/pages/sp_module/sp_set_main/sp_set_view.dart';
import 'package:sp_demo/pages/sp_module/theme_list/theme_list_view.dart';

/**
 * @Author: fanyuqing
 * @Description: 路由名
 * @date: 2022/8/25
 */
class RouteConfig {
  static const String appHomePage = "/"; // 首页
  static const String spSetPage = "/spSetPage"; // 沙盘设置页
  static const String themeListPage = "/themeListPage"; // 沙盘主题列表页
  static const String recordListPage = "/recordListPage"; // 沙盘档案页

  static const String spMainPage = "/spLandPage"; // 沙盘主页面

  static const String liveMainPage = "/liveMainPage"; // 直播间沙盘入口

  static const String spCheckPage = "/spCheckPage";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: appHomePage, page: () => const MyHomePage()),
    GetPage(name: spSetPage, page: () => SpSetPage()),
    GetPage(name: themeListPage, page: () => ThemeListPage()),
    GetPage(name: recordListPage, page: () => RecordListPage()),
    GetPage(name: liveMainPage, page: () => LiveSpPage()),
    GetPage(
      name: spMainPage,
      page: () => LiveSpJoinPage(),
    ),
  ];
}
