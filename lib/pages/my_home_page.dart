import 'package:flutter/material.dart';
import 'package:sp_demo/pages/sp_module/sp_main/sp_main_view.dart';

/// @Author: fanyuqing
/// @Description:
/// @date: 2022/8/22
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<Widget> _pageList = [SpMainPage(), LiveMainPage(), SpLiveMainPage(), SpCloudLivePage()];
  // final List<String> _pageTitle = ['沙盘演示', '直播间演示', '沙盘直播间演示', '沙盘云直播演示'];
  int _index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("沙盘演示"),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   // backgroundColor: Colors.white,
      //   selectedFontSize: 16.sp,
      //   unselectedFontSize: 16.sp,
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _index,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.padding), label: "沙盘"),
      //     BottomNavigationBarItem(icon: Icon(Icons.add), label: "直播间"),
      //     BottomNavigationBarItem(icon: Icon(Icons.image), label: "沙盘直播间"),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: "沙盘云直播"),
      //   ],
      //   onTap: (index) {
      //     _index = index;
      //     setState(() {});
      //   },
      // ),
      body: SpMainPage(),
    );
  }
}
