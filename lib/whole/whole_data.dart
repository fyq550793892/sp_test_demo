import 'package:sp_demo/beans/token_entity.dart';

/// @Author: fanyuqing
/// @Description:
/// @date: 2022/9/29

class WholeData {
  static final WholeData _wholeData = WholeData._instance();

  WholeData._instance();

  factory WholeData() {
    return _wholeData;
  }

  TokenData? tokenData;

  String appId = "app4dfaa4c545158";
  String secretKey = "f5217b132a0d70f4712f6325c11e5854";
  String userId = "";
}
