import 'package:flutter/material.dart';

class SpMainState {
  late TextEditingController controller;
  String initText = "";
  //  onQuit默认为false 暂定为true
  SpMainState() {
    initText = """{
    "autoMonitor":0,
    "openReturnGesture":true",
    "onQuit":false
  }""";
    controller = TextEditingController(text: initText);

    ///Initialize variables
  }
}
