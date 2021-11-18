import 'package:flutter/material.dart';
import '../sp_size.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback? callback;
  final String? message;

  NetErrorWidget({Key? key, this.callback, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: <Widget>[
          Image(
              image: new AssetImage('images/empty_img1.png'),
              width: 335.as,
              height: 331.as),
          Container(
            margin: EdgeInsets.only(top: 0.as),
            child: Text(
              "${message ?? "暂无数据"}",
              style: TextStyle(
                  fontSize: 14.sph, color: Color.fromRGBO(178, 178, 178, 1)),
            ),
          )
        ],
      ),
    );
  }
}
