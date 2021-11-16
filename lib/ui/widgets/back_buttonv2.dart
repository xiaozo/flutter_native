import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_boost/flutter_boost.dart';

class BackButtonV2 extends StatelessWidget {
  final VoidCallback? onPressed;
  const BackButtonV2({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BackButton(
      color: Colors.black,
      onPressed: onPressed ??
          () {
            BoostNavigator.instance.pop();
          },
    );
  }
}
