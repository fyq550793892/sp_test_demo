import 'dart:convert';
import 'dart:typed_data';

import 'package:cece_sp_module/utils/colors_util.dart';
import 'package:cece_sp_module/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:sp_demo/beans/token_entity.dart';
import 'package:sp_demo/net/apis.dart';
import 'package:sp_demo/routes/route_config.dart';
import 'package:sp_demo/utils/sq_toast.dart';
import 'package:sp_demo/utils/string_util.dart' as DemoStringUtil;
import 'package:sp_demo/whole/whole_data.dart';

import 'sp_set_logic.dart';

/**
 * @Author: fanyuqing
 * @Description: 路由名
 * @date: 2022/4/12
 */

class SpSetPage extends StatelessWidget {
  final logic = Get.put(SpSetLogic());
  final state = Get.find<SpSetLogic>().state;

  SpSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("沙盘设置主页面"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.w,
            ),
            Text("appid:${WholeData().appId}"),
            SizedBox(
              height: 10.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("UserId"),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  child: DropdownButtonDemoPage(),
                  width: 300.w,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("是否打开调试模式:"),
                GetBuilder<SpSetLogic>(
                  assignId: true,
                  builder: (logic) {
                    return Switch(
                      value: state.openDebug,
                      onChanged: (value) {
                        logic.changeSwitch(value);
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10.w,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConfig.spMainPage, arguments: {
                  "controller": state.sp3dController,
                  "data": DemoStringUtil.StringUtil.handleData(
                      path: "/fortune_island?fortune_data=m_59_47_63_69",
                      isXydPage: true),
                });
              },
              child: Text("进入星运岛"),
            ),
            Container(
              width: 200.w,
              // color: Colors.red,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("进入默认首页"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          toDefaultMain(path: "/?from=");
                        },
                        child: Text("${"传/"}"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          toDefaultMain(path: "");
                        },
                        child: Text("传\"\""),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          toDefaultMain(path: """/sha_pan?from=home""");
                        },
                        child: Text("${"传具体值"}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConfig.themeListPage);
              },
              child: Text("选择主题入口"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConfig.recordListPage);
              },
              child: Text("选择自己档案入口"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConfig.liveMainPage);
              },
              child: Text("进入直播间沙盘"),
            ),
            SizedBox(
              height: 30.w,
            ),
            Container(
              height: 50.w,
              width: 300.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.w),
              ),
              child: TextField(
                controller: state.textEditingController,
                decoration: InputDecoration(
                  hintText: "沙盘档案sharekey",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.w),
              ),
              child: Row(
                children: [
                  Text("进入分享档案页面"),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (state.textEditingController.text.isEmpty) {
                            SQToast.show("share_key不能为空");
                            return;
                          }
                          String path =
                              "/sha_pan/playbox?record_id=&share_key=${state.textEditingController.text}&from=";
                          toDefaultMain(path: path);
                        },
                        child: Text("普通访客"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (state.textEditingController.text.isEmpty) {
                            SQToast.show("share_key不能为空");
                            return;
                          }
                          String path =
                              "/sha_pan/playbox?from=text_consulting&share_key=${state.textEditingController.text}&mode=text_consulting&exit=fast";
                          toDefaultMain(path: path);
                        },
                        child: Text("文字咨询-自己"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (state.textEditingController.text.isEmpty) {
                            SQToast.show("share_key不能为空");
                            return;
                          }
                          String path =
                              "/sha_pan/playbox?from=text_psychologist&mode=text_consulting_psychologist&share_key=${state.textEditingController.text}&exit=fast";
                          toDefaultMain(path: path);
                        },
                        child: Text("文字咨询-咨询师"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
          ],
        ),
      ),
    );
  }

  void toDefaultMain({required String path}) {
    Get.toNamed(
      RouteConfig.spMainPage,
      arguments: {
        "data": DemoStringUtil.StringUtil.handleData(path: path),
        "controller": state.sp3dController,
        "share": (String message) {
          // 处理分享消息
          Map map = jsonDecode(message);
          String dataType = map['type'];
          if (dataType == "link") {
            // 连接分享 暂不处理,没有人来接收
          } else if (dataType == "complex") {
            String dataUrl = map['imageData']; // 分享图数据
            String sPName = map['recordName']; // 沙盘档案名
            int themeId = map['themeId']; // 1主 2通用 3亲密 19职业
            String themName = map['themeName']; // 主题名
            String spUnscramble = map['unscramble']; // 解读标签数组
            List<String> spUnscrambleItems = spUnscramble.split("_").sublist(1);
            Uint8List bytes = base64Decode(dataUrl);
            String userName = "我是用户名"; // 用户名
            state.sp3dController.onShareHandleOver(
              _shareChildWidget(
                sPName,
                bytes,
                spUnscrambleItems,
                themeId,
                userName,
              ),
            );
          }
        }
      },
    );
  }

  // 分享页widget
  Widget _shareChildWidget(String sPName, Uint8List bytes,
      List<String> spUnscrambleItems, int spType, String userName) {
    /// @Author fanyuqing
    /// @Description 分享页widget
    /// @Param [spTitle-沙盘标题, isMainSP-是不是主沙盘, sPName-沙盘名, bytes-截图byte, spUnscrambleItems-标签列表]
    /// @Date 2022/7/22
    ///
    return Container(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 24.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(StringUtil.getAssets("sp_share_bg.png")),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SingleLineFittedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 11.w),
                    child: Text(
                      "$userName的",
                      style: TextStyle(
                          fontSize: 16.w,
                          color: ColorsUtil.spTextColor,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Image.asset(
                    _fortuneIsLandAssets(spType),
                    width: 157.w,
                    height: 52.w,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.1.w),
              border: Border.all(
                color: Colors.white,
                width: 2.0.w,
              ),
            ),
            height: 300.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.1.w),
                    child: Image.memory(
                      bytes,
                      fit: BoxFit.fill,
                    ),
                  ),
                  top: 0,
                  left: 0,
                  right: 0,
                ),
                Positioned(
                  child: Visibility(
                    visible: !(spType == 1 || spType == 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsUtil.spBgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            7.1.w,
                          ),
                          topRight: Radius.circular(
                            7.1.w,
                          ),
                        ),
                      ),
                      height: 23.2.w,
                      alignment: Alignment.center,
                      child: Text(
                        sPName,
                        style: TextStyle(
                          fontSize: 11.7.w,
                          color: ColorsUtil.spTextColor,
                        ),
                      ),
                    ),
                  ),
                  left: 0,
                  right: 0,
                  top: 0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: spUnscrambleItems.isEmpty ? 0 : 14.6.w,
          ),
          Visibility(
            visible: spUnscrambleItems.isNotEmpty,
            child: Text(
              "解读标签",
              style: TextStyle(
                fontSize: 16.w,
                fontWeight: FontWeight.bold,
                color: ColorsUtil.spTextColor,
              ),
            ),
          ),
          SizedBox(
            height: spUnscrambleItems.isEmpty ? 0 : 14.6.w,
          ),
          Visibility(
            child: _buildTagsWidget(spUnscrambleItems),
            visible: spUnscrambleItems.isNotEmpty,
          ),
          SizedBox(
            height: 14.w,
          ),
          Image.asset(
            StringUtil.getAssets("sp_share_cece_down.png"),
          ),
        ],
      ),
    );
  }

  String _fortuneIsLandAssets(int spType) {
    if (spType == 1 || spType == 2) {
      return StringUtil.getAssets(
        "sp_xinli.png",
      );
    } else if (spType == 3) {
      return StringUtil.getAssets("sp_qinmi.png");
    } else if (spType == 19) {
      return StringUtil.getAssets("sp_zhiye.png");
    } else {
      return StringUtil.getAssets(
        "sp_xinli.png",
      );
    }
  }

  // 标签widget
  Widget _buildTagsWidget(List<String> spUnscrambleItems) {
    double fontSize = 14.w;
    return Container(
      height: 88.w,
      child: Wrap(
          clipBehavior: Clip.hardEdge,
          runSpacing: 12.w,
          spacing: 6.w,
          children: spUnscrambleItems
              .take(spUnscrambleItems.length)
              .map<Widget>((String tag) {
            return Container(
              height: 32.w,
              padding: EdgeInsets.only(
                left: 12.w,
                right: 12.w,
                top: 6.w,
                bottom: 6.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    18.w,
                  ),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter, //右上
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(253, 195, 148, 1),
                    Color.fromRGBO(255, 156, 116, 1),
                    Color.fromRGBO(255, 143, 123, 1),
                  ],
                ),
              ),
              child: Text(
                tag,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                ),
              ),
            );
          }).toList()),
    );
  }
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
              //maxWidth: constraints.maxWidth
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class DropdownButtonDemoPage extends StatefulWidget {
  @override
  _DropdownButtonDemoPageState createState() => _DropdownButtonDemoPageState();
}

class _DropdownButtonDemoPageState extends State<DropdownButtonDemoPage> {
  var selectItemValue = 'stfff597525aee6dbf260a58a42d';

  final logic = Get.find<SpSetLogic>();
  final state = Get.find<SpSetLogic>().state;

  List<DropdownMenuItem<String>> generateItemList() {
    final List<DropdownMenuItem<String>> items = [];
    final DropdownMenuItem<String> item1 = DropdownMenuItem(
      child: Text('stfff597525aee6dbf260a58a42d'),
      value: 'stfff597525aee6dbf260a58a42d',
    );
    final DropdownMenuItem<String> item2 = DropdownMenuItem(
      child: Text('user2'),
      value: 'user2',
    );
    final DropdownMenuItem<String> item3 = DropdownMenuItem(
      child: Text('anchor'),
      value: 'anchor',
    );

    items.add(item1);
    items.add(item2);
    items.add(item3);

    return items;
  }

  @override
  void initState() {
    super.initState();
    WholeData().userId = selectItemValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // 提示文本
      hint: Text('请选择一个user'),
      // 下拉列表的数据
      items: generateItemList(),
      // 改变事件
      onChanged: (value) {
        _changeWay(value ?? "");
      },
      // 是否撑满
      isExpanded: true,
      value: selectItemValue,
      // 图标大小
      iconSize: 48,
      // 下拉文本样式
      style: TextStyle(color: Colors.black),
    );
  }

  void _changeWay(String value) async {
    selectItemValue = value;
    WholeData().userId = selectItemValue;
    Map<String, dynamic> params = Map();
    params['secret'] = WholeData().secretKey;
    params['user_id'] = WholeData().userId;
    params['is_cece_master'] = selectItemValue == "anchor" ? true : false;
    if (selectItemValue == "anchor") {
      logic.changeUserForAnchor(true);
    }
    var result = await SpMainApis.getToken(params: params);
    WholeData().tokenData = TokenData.fromJson(result['data']);
    setState(() {});
  }
}
