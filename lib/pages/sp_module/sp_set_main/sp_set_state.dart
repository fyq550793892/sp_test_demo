import 'package:cece_sp_module/sp_3d_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:sp_demo/beans/token_entity.dart';

class SpSetState {
  late TextEditingController textEditingController;
  late Sp3DController sp3dController;
  bool openDebug = true;
  TokenData? tokenData;
  bool changeAnchor = false;
  SpSetState() {
    textEditingController = TextEditingController();
    sp3dController = Sp3DController();
  }
}
