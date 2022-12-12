import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:sp_demo/routes/route_config.dart';

import 'sp_main_logic.dart';

class SpMainPage extends StatelessWidget {
  final logic = Get.put(SpMainLogic());
  final state = Get.find<SpMainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30.w,
          ),
          Text(
            """""",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 30.w,
          ),
          Container(
            decoration: BoxDecoration(
                // color: Colors.blue,
                border: Border.all(
              color: Colors.black,
              width: 1.w,
            )),
            height: 200.w,
            width: 300.w,
            child: TextField(
              controller: state.controller,
              maxLines: 100,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "请设置初始Option,不设置为默认",
              ),
            ),
          ),
          SizedBox(
            height: 50.w,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                RouteConfig.spSetPage,
                arguments: {
                  "options": state.controller.text,
                },
              );
            },
            child: const Text("设置初始Option,进入应用"),
          ),
        ],
      ),
    );
  }
}
