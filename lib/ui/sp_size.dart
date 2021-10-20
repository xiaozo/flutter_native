import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Sp on num {
  double get sph => ScreenUtil().scaleWidth * this;
  double get ascale => this.w;
}
