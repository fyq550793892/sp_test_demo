class Constant {
  static String? VERSION;

  static String? userAgent = "";

  /// 获取到的网络状态 是wifi or 移动网络
  static String NETWORK_TYPE = "none";

  static const bool isDebug = true;

  ///是否是正式化
  static bool isFormal = false;
  static const String ANALYTICS_BASE_URL = "https://dataservice.cece.com"; //神策正式
  static const String ANALYTICS_DEBUG_BASE_URL = "http://testdataservice.cece.com"; //神策测试
  static String BASE_URL = isFormal ? BASE_URL_FORMAL : BASE_URL_TEST;
  static String BASEH5_URL = isFormal ? BASE_H5_URL : BASE_H5_URL_TEST;

  //HTTP domain
  static const String BASE_URL_FORMAL = "https://api.cece.com";
  static const String BASE_URL_TEST = "http://api-test.cece.com";

  //HTML domain
  static const String BASE_H5_URL = "https://m.cece.com"; //测试
  static const String BASE_H5_URL_TEST = "https://m-test.cece.com"; //测试
  static const String XXWOLO_DOMAIN = "xxwolo.com"; //老页面的domain

}

///app类型
enum AppType { cece, cece_overseas }
