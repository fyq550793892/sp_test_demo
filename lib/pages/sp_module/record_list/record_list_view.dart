import 'package:cece_sp_module/sp_3d_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:sp_demo/beans/sp_main/sp_theme_entity.dart';
import 'package:sp_demo/pages/sp_module/record_list/record_list_logic.dart';
import 'package:sp_demo/routes/route_config.dart';
import 'package:sp_demo/utils/string_util.dart';

class RecordListPage extends StatelessWidget {
  final logic = Get.put(RecordListLogic());
  final state = Get.find<RecordListLogic>().state;

  RecordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的档案列表"),
      ),
      body: GetBuilder<RecordListLogic>(
        assignId: true,
        builder: (logic) {
          return _buildColumn(logic);
        },
      ),
    );
  }

  Widget _buildColumn(RecordListLogic logic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<SpThemeDataDataList>(
          value: state.spThemeData?.dataList![state.chooseNum],
          items: state.spThemeData?.dataList!.map((SpThemeDataDataList items) {
            return DropdownMenuItem<SpThemeDataDataList>(
              child: Text(items.themeInfo?.name ?? ""),
              value: items,
            );
          }).toList(),
          onChanged: (value) {
            logic.changeChooseRecordText(value ?? SpThemeDataDataList());
          },
        ),
        _buildHistoryView(),
      ],
    );
  }

  Widget _buildHistoryView() {
    if (state.spHistoryData == null || state.spHistoryData!.records == null || state.spHistoryData!.records!.isEmpty) {
      return Center(
        child: Padding(
          child: Text("暂无历史数据"),
          padding: EdgeInsets.only(top: 30.w),
        ),
        // padding: EdgeInsets.only(top: 50.w),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(top: 20.w),
          child: ElevatedButton(
            onPressed: () {
              String path = "/sha_pan/playbox?record_id=${state.spHistoryData?.records![index][0]['id']}&from=";
              Get.toNamed(
                RouteConfig.spMainPage,
                arguments: {
                  "data": StringUtil.handleData(path: path),
                  "controller": Sp3DController(),
                },
              );
            },
            child: Text(
                "${state.spHistoryData?.records![index][0]['title']}(${state.spHistoryData?.records![index][0]['create_at']})"),
          ),
          width: double.infinity,
          alignment: Alignment.center,
        );
      },
      itemCount: state.spHistoryData?.records!.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
