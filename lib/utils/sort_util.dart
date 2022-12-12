/// @Author: fanyuqing
/// @Description:
/// @date: 2022/9/29
class SortUtil {
  static Map<String, dynamic> keySort(Map<String, dynamic> oldParamsMap) {
    Map<String, dynamic> newParamsMap = Map();
    List<String> oldKeys = oldParamsMap.keys.toList();
    if (oldKeys.isEmpty) return newParamsMap;
    oldKeys.sort((a, b) {
      List<int> al = a.codeUnits;
      List<int> bl = b.codeUnits;
      for (int i = 0; i < al.length; i++) {
        if (bl.length <= i) return 1;
        if (al[i] > bl[i]) {
          return 1;
        } else if (al[i] < bl[i]) return -1;
      }
      return 0;
    });
    print(oldKeys);
    for (int i = 0; i < oldKeys.length; i++) {
      newParamsMap[oldKeys[i]] = oldParamsMap[oldKeys[i]]!;
    }
    return newParamsMap;
  }
}
