import 'dart:convert';

import 'package:cece_sp_module/sp_3d_page.dart';
import 'package:cece_sp_module/utils/sp_3d_manager.dart';
import 'package:cece_sp_module/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:sp_demo/beans/token_entity.dart';
import 'package:sp_demo/net/apis.dart';
import 'package:sp_demo/pages/sp_module/sp_set_main/sp_set_logic.dart';
import 'package:sp_demo/routes/route_config.dart';
import 'package:sp_demo/utils/sq_toast.dart';
import 'package:sp_demo/whole/whole_data.dart';

import 'live_sp_join_logic.dart';

/// @Author: fanyuqing
/// @Description:直播蒙层
/// @date: 2022/10/10

class LiveSpJoinPage extends StatelessWidget {
  final logic = Get.put(LiveSpJoinLogic());
  final state = Get.find<LiveSpJoinLogic>().state;

  LiveSpJoinPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLive = Get.arguments['isLive'] == true;
    Sp3DController sp3dController =
        Get.arguments['controller'] ?? Sp3DController();
    return Scaffold(
      floatingActionButton: isLive
          ? FloatingActionButton(
              child: Text("蒙层"),
              onPressed: () {
                logic.changeMengCeng(!state.showMengCeng);
              },
              heroTag: 'other',
            )
          : null,
      body: Stack(
        children: [
          Sp3DPage(
            data:
                """{"appId":"app263ac621248f1","userId":"stfff597525aee6dbf260a58a42d","userToken":"72e5d7abaaeb4d6f83e8d8c0e9ac9ce0","signSecret":"44d24f8c131e481390c2d119b9f26752","path":"/sha_pan?from=tools","extraData":"","options":{"ceceParams":{"baseUrl":"http://api-test.cece.com","appSecret":"12d282f3733009cd587784903b605860","route":"ShaPan","appid":"cece","vs":"9.24.2","apikey":"20c49dae7fb0ec3e7531a5b1e608f56e","client":"android","agent":"andr.cc","appType":"cece","channel":"xxwolo","deviceId":"892822d8e5c1f7e52281d96fd1aa7c6e","iosidfa":"33c2b81a1e4e46a3","brand":"vivo","model":"V2046A","carrier":"","lang":"zh-CN","uuid":"d8329c74-123e-310d-ac98-c211b6c614a3","fortuneData":"m/64/57/67/70"},"autoMonitor":30,"openReturnGesture":true,"onQuit":"false","openTimestamp":1667455970957,"userAgent":"Cece/9.24.2 Mozilla/5.0 (Linux; Android 11; V2046A Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36"}}""",
            openDebug: Get.find<SpSetLogic>().state.openDebug,
            onQuit: (Map quitParams) {
              // // quitParams示例为: {"page":"/sha_pan"}
              // SQToast.show("三方处理沙盘退出Toast");
              // Sp3DManager().spExit(quitParams: quitParams);
            },
            sp3dController: sp3dController,
            onMessage: (String msgEvent, String msgContent) {
              // 处理消息
              // 如msgEvent为consultMsg，则将其msgContent打印出来
              if (msgEvent == SpMsgEventStrUtil.objectClick) {
                SQToast.show("打印consultMsg");
                Get.toNamed(RouteConfig.spCheckPage);
                // state.lastTextEditingController.text = msgContent;
              } else if (msgEvent == SpMsgEventStrUtil.signInvalid) {
                SQToast.show("获取签名");
                _getNewToken();
              } else {}
            },
            // onShare: Get.arguments['share'],
          ),
          GetBuilder<LiveSpJoinLogic>(
            assignId: true,
            builder: (logic) {
              return Visibility(
                visible: isLive && state.showMengCeng,
                child: Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Color(0x60000000),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "上轮操作信令复制区",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            height: 100.w,
                            width: 300.w,
                            color: Colors.white,
                            child: TextField(
                              controller: state.lastTextEditingController,
                              maxLines: 100,
                            ),
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                          Text(
                            "信令消息体传入区",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            height: 80.w,
                            width: 300.w,
                            color: Colors.white,
                            child: TextField(
                              controller: state.toUnityEditingController,
                              maxLines: 100,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                String text =
                                    state.toUnityEditingController.text;
                                Sp3DManager().spSendMessage(
                                    msgType: SpMsgTypeStrUtil.consultMsg,
                                    msgContent: text);

                                Map<String, dynamic> params = {};
                                params['msgType'] = SpMsgTypeStrUtil.consultMsg;
                                params['msgContent'] = text;
                                state.sendMsg = json.encode(params);
                                logic.mUpdate();
                              },
                              child: Text("将信令传入当前沙盘")),
                          ElevatedButton(
                            onPressed: () {
                              Sp3DManager().spSendMessage(
                                  msgType: SpMsgTypeStrUtil.gotoConsult,
                                  msgContent: "");
                              Map<String, dynamic> params = {};
                              params['msgType'] = SpMsgTypeStrUtil.gotoConsult;
                              params['msgContent'] = "";
                              state.sendMsg = json.encode(params);
                              logic.mUpdate();
                            },
                            child: Text("切换到直播间沙盘"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Sp3DManager().spExit();
                            },
                            child: Text("退出spExit()"),
                          ),
                          Container(
                            child: Text("发送的数据是:${state.sendMsg}"),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void _getNewToken() async {
    // 签名过期,重新获取签名后传入unity
    Map<String, dynamic> params = {};
    params['secret'] = WholeData().secretKey;
    params['user_id'] = WholeData().userId;
    var result = await SpMainApis.getToken(params: params);
    WholeData().tokenData = TokenData.fromJson(result['data']);
    // 向unity发送数据
    Map<String, dynamic> msgParams = {};
    msgParams['userToken'] = WholeData().tokenData?.token;
    msgParams['signSecret'] = WholeData().tokenData?.secret;
    Sp3DManager()
        .spSendMessage(msgType: "userSig", msgContent: json.encode(msgParams));
  }
}
