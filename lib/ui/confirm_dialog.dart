import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supercharged/supercharged.dart';

import 'image_button.dart';
import 'screen.dart';

Future<bool?> showConfirmDialog(BuildContext context, String title) {
  return showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 487.h,
          height: 230.h,
          padding:
              EdgeInsets.only(left: 30.h, right: 30.h, top: 0.h, bottom: 30.h),
          decoration: BoxDecoration(
              color: '#ffffff'.toColor(),
              borderRadius: BorderRadius.circular(30.h)),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sph,
                      color: '#000000'.toColor(),
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageButton.yellow(
                    width: 180.h,
                    height: 56.h,
                    title: "取消",
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                  ImageButton.orange(
                    width: 180.h,
                    height: 56.h,
                    title: "确定",
                    onPressed: () => Navigator.of(context).pop(true),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
