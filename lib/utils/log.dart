import 'package:r_logger/r_logger.dart';
import 'package:flutter/foundation.dart';

void yqLog(Object message, StackTrace current, {bool isDebug = kDebugMode}) {
  if(isDebug) {
    HYCustomTrace programInfo = HYCustomTrace(current);
    RLogger.instance?.d("所在文件: ${programInfo.fileName}, 所在行: ${programInfo.lineNumber}, 打印信息: $message");
  }
}

void yqLogE(Object message, StackTrace current, {bool isDebug = kDebugMode}) {
  if(isDebug) {
    HYCustomTrace programInfo = HYCustomTrace(current);
    RLogger.instance?.e("所在文件: ${programInfo.fileName}, 所在行: ${programInfo.lineNumber}, 打印信息: $message", "出现错误了!!!!!", current);
  }
}

void yqLogI(Object message, StackTrace current, {bool isDebug = kDebugMode}) {
  if(isDebug) {
    HYCustomTrace programInfo = HYCustomTrace(current);
    RLogger.instance?.i("所在文件: ${programInfo.fileName}, 所在行: ${programInfo.lineNumber}, 打印信息: $message");
  }
}

class HYCustomTrace {
  final StackTrace _trace;

  String? fileName;
  int? lineNumber;
  int? columnNumber;

  HYCustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = this._trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}