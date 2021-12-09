import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_deerclass/ui/sp_size.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = false,
}) {
  if (Platform.isIOS) {
    //ios相关代码
    return showCupertinoDialog(
        context: context,
        builder: builder,
        barrierLabel: barrierLabel,
        barrierDismissible: barrierDismissible,
        routeSettings: RouteSettings(name: "Popdisappeared_AppDialog"));
  } else {
    //android相关代码
    return showDialog(
        context: context,
        builder: builder,
        barrierLabel: barrierLabel,
        barrierDismissible: barrierDismissible,
        routeSettings: RouteSettings(name: "Popdisappeared_AppDialog"));
  }
}

Widget dialog(BuildContext context,
    {Widget? title, Widget? content, List<Widget>? actions}) {
  if (actions == null) actions = [];
  if (Platform.isIOS) {
    //ios相关代码
    return CupertinoAlertDialog(
        title: title, content: content, actions: actions);
  } else {
    //android相关代码
    return AlertDialog(title: title, content: content, actions: actions);
  }
}

Widget dialogAction(BuildContext context, String title,
    {VoidCallback? onPressed, Color? textColor, double? fontSize}) {
  textColor ??= Theme.of(context).primaryColor;
  fontSize ??= fontSize ?? 14.sph;
  TextStyle style = TextStyle(color: textColor, fontSize: fontSize);
  if (Platform.isIOS) {
    //ios相关代码
    return CupertinoDialogAction(
        child: Text(title, style: style), onPressed: onPressed);
  } else {
    //android相关代码
    return TextButton(child: Text(title, style: style), onPressed: onPressed);
  }
}
