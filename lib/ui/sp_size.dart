import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Sp on num {
  double get sph => ScreenUtil().scaleWidth * this;
  double get as => this.w;
}

///éçšćé
final kViewMargin = 15.as;
