import 'package:cece_sp_module/sp_3d_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sp_demo/net/apis.dart';
import 'package:sp_demo/routes/route_config.dart';
import 'package:sp_demo/utils/string_util.dart';

import 'theme_list_logic.dart';

class ThemeListPage extends StatelessWidget {
  final logic = Get.put(ThemeListLogic());
  final state = Get.find<ThemeListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("沙盘主题列表"),
      ),
      body: GetBuilder<ThemeListLogic>(
        assignId: true,
        builder: (logic) {
          return _buildListView();
        },
      ),
    );
  }

  Widget _buildListView() {
    if (state.spThemeData == null || state.spThemeData!.dataList == null) {
      return Center(
        child: Text("沙盘数据错误"),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: 30.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("获取的直播的key为:"),
              ElevatedButton(onPressed: () {}, child: Text("复制")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.w),
              itemBuilder: (context, index) {
                return _buildSpRow(
                  context,
                  title: state.spThemeData?.dataList![index].themeInfo?.name ??
                      "未命名",
                  idNum: state.spThemeData?.dataList![index].themeInfo?.id ?? 0,
                );
              },
              itemCount: state.spThemeData?.dataList!.length,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildSpRow(
    BuildContext context, {
    required String title,
    required int idNum,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              // 跳到沙盘
              String path = "/sha_pan/playbox?theme_id=$idNum&from=demo";
              Get.toNamed(
                RouteConfig.spMainPage,
                arguments: {
                  "data": StringUtil.handleData(path: path),
                  "controller": Sp3DController(),
                },
              );
            },
            child: Text(title),
          ),
          // SizedBox(
          //   width: 20.w,
          // ),
          ElevatedButton(
            onPressed: () {
              String path = "/sha_pan/record_list?theme_id=$idNum&from=";
              Get.toNamed(
                RouteConfig.spMainPage,
                arguments: {
                  "data": StringUtil.handleData(path: path),
                  "controller": Sp3DController(),
                },
              );
              // Get.toNamed(RouteConfig.recordListPage, arguments: idNum);
            },
            child: Text("历史列表"),
          ),
          ElevatedButton(
            onPressed: () {
              SpMainApis.postReport(params: {"aa": "bb"});
              // String path = "/sha_pan/record_list?theme_id=$idNum&from=";
              // Get.toNamed(
              //   RouteConfig.spMainPage,
              //   arguments: {
              //     "data": StringUtil.handleData(path: path),
              //     "controller": Sp3DController(),
              //   },
              // );
              // Get.toNamed(RouteConfig.recordListPage, arguments: idNum);
            },
            child: Text("直播授权key"),
          ),
        ],
      ),
    );
  }
}
