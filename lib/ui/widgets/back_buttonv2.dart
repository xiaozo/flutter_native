import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_boost/boost_navigator.dart';

class BackButtonV2 extends StatelessWidget {
  final VoidCallback? onPressed;
  VoidCallback? _onPressed;
  BackButtonV2({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _onPressed ??= this.onPressed ??
        () {
          BoostNavigator.instance.pop();
        };

    return BackButton(
      color: Colors.black,
      onPressed: _onPressed,
    );
  }
}
