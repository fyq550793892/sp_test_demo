import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sp_demo/beans/sp_main/message_entity.dart';

class LiveSpJoinState {
  late TextEditingController lastTextEditingController;
  TextEditingController toUnityEditingController = TextEditingController();
  bool showMengCeng = false;
  MessageEntity messageEntity = MessageEntity();
  String sendMsg = "";

  LiveSpJoinState() {
    messageEntity.gameObject = "UnityMessageManager";
    messageEntity.methodName = "flutterBack";
    messageEntity.message = "";

    lastTextEditingController = TextEditingController(text: json.encode(messageEntity));

    ///Initialize variables
  }
}
