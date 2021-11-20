import 'package:flutter/material.dart';
import '../sp_size.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback? callback;
  final String? message;
  final String? errorImgAssetName;

  NetErrorWidget(
      {Key? key, this.callback, this.message, this.errorImgAssetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: <Widget>[
          Image(
              image: errorImgAssetName != null
                  ? new AssetImage(errorImgAssetName!)
                  : new AssetImage('images/empty_img1.png'),
              width: 335.as,
              height: 331.as),
          Container(
            margin: EdgeInsets.only(top: 0.as),
            child: Text(
              "${message ?? "当前暂无对应的数据内容"}",
              style: TextStyle(
                  fontSize: 14.sph, color: Color.fromRGBO(178, 178, 178, 1)),
            ),
          )
        ],
      ),
    );
  }
}
