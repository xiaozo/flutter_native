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
        height: 27,
        width: 28,
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
    return ImageButtonV2(
      width: 16,
      height: 30,
      pressedImage: Image.asset(
        "images/return_action.png",
      ),
      unpressedImage: Image.asset(
        "images/return_action.png",
      ),
      children: [],
      onTap: onPressed ??
          () {
            BoostNavigator.instance.pop();
          },
    );
    return BackButton(
      color: Colors.black,
      onPressed: onPressed ??
          () {
            BoostNavigator.instance.pop();
          },
    );
  }
}
