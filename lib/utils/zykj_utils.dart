import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

extension ConverTimeSting on int {
  ///将秒转化成媒体对应的时间 '00:00'
  String get mediaTimeStr {
    int second = this;
    int totalMinite = second ~/ 60;
    int leftSecond = second % 60;
    int totalHours = totalMinite ~/ 60;
    int leftMinite = totalMinite % 60;

    String hoursStr = '';
    if (totalHours > 0) {
      hoursStr = totalHours < 10 ? '0${totalHours}:' : '${totalHours}:';
    }

    String miniteStr = '00:';
    if (leftMinite > 0) {
      miniteStr = leftMinite < 10 ? '0${leftMinite}:' : '${leftMinite}:';
    }

    String secondStr = '00';
    if (leftSecond > 0) {
      secondStr = leftSecond < 10 ? '0${leftSecond}' : '${leftSecond}';
    }

    return '${hoursStr}${miniteStr}${secondStr}';
  }
}

extension ToolConverForSting on String {
  ///分页pagenum字符串++
  String pageNumIncreaseStr() {
    return (int.parse(this) + 1).toString();
  }
}

class ZykjUtils {
  ///格式化时间戳
  ///timeSamp:秒值
  ///format:"yyyy年MM月dd hh:mm:ss"  "yyy?MM?dd  hh?MM?dd" "yyyy:MM:dd"......
  ///结果： 2019?08?04  02?08?02
  static String getFormatData(int timeSamp, {String format = 'yyyy-MM-dd'}) {
    timeSamp = timeSamp * 1000;
    var dataFormat = new DateFormat(format);
    var dateTime = new DateTime.fromMillisecondsSinceEpoch(timeSamp);
    String formatResult = dataFormat.format(dateTime);
    return formatResult;
  }

  ///将时间日期格式转化为时间戳
  ///2018年12月11日
  ///2019-12-11
  ///2018年11月15 11:14分89
  ///结果是秒
  static int getTimeStap({String? formatData}) {
    if (formatData != null) {
      var result = formatData.substring(0, 4) +
          "-" +
          formatData.substring(5, 7) +
          "-" +
          formatData.substring(8, 10);
      if (formatData.toString().length >= 13) {
        result += "" + formatData.substring(10, 13);
      }
      if (formatData.toString().length >= 17) {
        result += ":" + formatData.substring(14, 16);
      }
      if (formatData.toString().length >= 19) {
        result += ":" + formatData.substring(17, 19);
      }
      var dataTime = DateTime.parse(result);

      return dataTime.millisecondsSinceEpoch ~/ 1000;
    } else {
      return DateTime.now().millisecondsSinceEpoch ~/ 1000;
    }
  }

  ///截屏
  static Future<Uint8List?> captureScreen(GlobalKey rootWidgetKe) async {
    try {
      RenderRepaintBoundary boundary = rootWidgetKe.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 1.0);
      ByteData byteData =
          (await image.toByteData(format: ImageByteFormat.png))!;
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes; //这个对象就是图片数据
    } catch (e) {
      print(e);
    }
    return null;
  }
}
