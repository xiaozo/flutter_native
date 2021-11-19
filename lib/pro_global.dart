import 'dart:ui';

import 'package:flutter/material.dart';

final kLineColor = const Color.fromRGBO(228, 228, 228, 1);
final kGrayDarkColor = const Color(0xFF9b9b9b);
final kGrayColor = const Color(0xFFb2b2b2);
final kGrayThinColor = const Color(0xFFcbcbcb);

final kGradientMainBColor = const Color.fromRGBO(255, 129, 73, 1);
final kgradientMainEColor = const Color.fromRGBO(255, 174, 73, 1);

/**
 * 常量枚举
 */
final OrderStatus_wait = 0;
final OrderStatus_finish = 1;
final OrderStatus_cancel = 2;

/**
 * 函数
 */
///默认阴影
BoxShadow AppBoxShadow() {
  return const BoxShadow(
    color: Colors.grey,
    offset: Offset(-1.0, 2.0), //阴影y轴偏移量
    blurRadius: 5.0, //阴影模糊程度
  );
}
