import 'package:flutter/material.dart';
import '../sp_size.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback? callback;
  final String? message;

  NetErrorWidget({Key? key, this.callback, this.message = "暂无数据"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: callback,
        child: Column(
          children: <Widget>[
            Image(
                image: new AssetImage('images/empty_img1.png'),
                width: 335.as,
                height: 331.as),
            Container(
              margin: EdgeInsets.only(top: 0.as),
              child: Text("${message}"),
            )
          ],
        ),
      ),
    );
  }
}
