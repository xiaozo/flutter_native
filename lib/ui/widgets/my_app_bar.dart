import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget child;

  const MyAppBar({Key? key, required this.child}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return this.child;
  }
}

class MyAppNavTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const MyAppNavTitle({Key? key, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.as,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }
}
