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
  String pageNumIncreaseStr() {
    return (int.parse(this) + 1).toString();
  }
}

class ZykjUtils {}
