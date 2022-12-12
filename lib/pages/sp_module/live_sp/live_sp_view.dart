import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:sp_demo/pages/sp_module/sp_set_main/sp_set_logic.dart';
import 'package:sp_demo/routes/route_config.dart';
import 'package:sp_demo/utils/string_util.dart';

import 'live_sp_logic.dart';

/// @Author: fanyuqing
/// @Description: 直播入口
/// @date: 2022/10/10

class LiveSpPage extends StatelessWidget {
  final logic = Get.put(LiveSpLogic());
  final state = Get.find<LiveSpLogic>().state;

  final spSetLogin = Get.find<SpSetLogic>();
  final spSetState = Get.find<SpSetLogic>().state;

  LiveSpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("直播间沙盘入口"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50.w,
          ),
          Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: TextField(
              controller: state.keyEditingController,
              decoration: InputDecoration(
                hintText: "沙盘shareKey",
              ),
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: spSetState.changeAnchor,
                child: ElevatedButton(
                  onPressed: () {
                    // 进入沙盘
                    Get.toNamed(RouteConfig.spMainPage, arguments: {
                      "data": StringUtil.handleData(
                          path:
                              "/group_sandplay/consult?share_key=${state.keyEditingController.text}&role=1&from="),
                      "isLive": true,
                    });
                  },
                  child: Text("主播角色进入"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: !spSetState.changeAnchor,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("用户角色主动进入"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 进入沙盘
                      Get.toNamed(RouteConfig.spMainPage, arguments: {
                        "data": StringUtil.handleData(
                            path:
                                "/group_sandplay/consult?share_key=${state.keyEditingController.text}&role=2&from="),
                        "isLive": true,
                      });
                    },
                    child: Text("进直播界面"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 进入沙盘
                      Get.toNamed(RouteConfig.spMainPage, arguments: {
                        "data": StringUtil.handleData(
                            path:
                                "/group_sandplay/playbox?consult_share_key=${state.keyEditingController.text}&from="),
                        "isLive": true,
                      });
                    },
                    child: Text("进自己界面"),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.w),
            child: Text(
              "信令消息体(留空进默认首页)",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          Container(
            height: 200.w,

            margin: EdgeInsets.only(left: 30.w, right: 30.w),
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: state.signalingEditingController,
              decoration: InputDecoration(
                hintText: "请输入信令消息体",
                border: InputBorder.none,
              ),
              maxLines: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.w, right: 60.w, top: 20.w),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConfig.spMainPage, arguments: {
                  "data": StringUtil.handleData(
                      path: "/group_sandplay/consult?from=",
                      extraData: state.signalingEditingController.text),
                  "isLive": true,
                });
              },
              child: Text("用户角色被动进入"),
            ),
          ),
        ],
      ),
    );
  }
}
