import 'package:get/get.dart';

import 'live_sp_join_state.dart';

class LiveSpJoinLogic extends GetxController {
  final LiveSpJoinState state = LiveSpJoinState();

  void changeMengCeng(bool vale) {
    state.showMengCeng = vale;
    update();
  }

  void mUpdate() {
    update();
  }
}
