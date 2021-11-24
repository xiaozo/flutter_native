import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_deerclass/ui/widgets/image_buttonv2.dart';

class BackButtonV2 extends StatelessWidget {
  final VoidCallback? onPressed;
  const BackButtonV2({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GestureDetector(
      onTap: onPressed ??
          () {
            BoostNavigator.instance.pop();
          },
      child: Container(
        width: 28,
        height: 27,
        child: Row(
          children: [
            Image(
                image: new AssetImage('images/return_action.png'),
                width: 16,
                height: 27),
            Expanded(
                child: Container(
              height: 27,
              color: Colors.transparent,
            ))
          ],
        ),
      ),
    );

    // return BackButton(
    //   color: Colors.black,
    //   onPressed: onPressed ??
    //       () {
    //         BoostNavigator.instance.pop();
    //       },
    // );
  }
}
