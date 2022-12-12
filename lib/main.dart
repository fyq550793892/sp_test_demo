import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:r_logger/r_logger.dart';
import 'package:sp_demo/routes/route_config.dart';
import 'package:sp_demo/utils/common.dart';
import 'package:sp_demo/utils/log.dart';
import 'package:sp_demo/utils/package_util.dart';

void main() {
  init();
  runApp(const MyApp());
}

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  RLogger.initLogger(tag: 'fyqLog:', filePath: 'test');
  await FkUserAgent.init();
  Constant.VERSION = '${FkUserAgent.getProperty('applicationVersion')}';
  Constant.userAgent = "3DDemo/${Constant.VERSION} ${FkUserAgent.webViewUserAgent}";
  PackageUtil.packageInfo = await PackageInfo.fromPlatform();
  yqLog("pack = ${PackageUtil.packageInfo} userAgent = ${Constant.userAgent} ", StackTrace.current);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 750),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: RouteConfig.appHomePage,
          getPages: RouteConfig.getPages,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: EasyLoading.init(builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          }),
        );
      },
    );
  }
}
