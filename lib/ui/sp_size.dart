import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Sp on num {
  double get sph => ScreenUtil().scaleHeight * this;
}
