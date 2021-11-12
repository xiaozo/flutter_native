import 'package:flutter/widgets.dart';

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
