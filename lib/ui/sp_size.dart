import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Sp on num {
  double get sph => ScreenUtil().scaleWidth * this;
  double get as => this.w;
}

///通用变量
final kViewMargin = 15.as;
