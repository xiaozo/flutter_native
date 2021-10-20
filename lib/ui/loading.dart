import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supercharged/supercharged.dart';

import 'screen.dart';

// 小鹿动画加载页
class Loading extends StatelessWidget {
  final List<Image> _images = [];
  static const _imageCount = 7;

  Loading({Key? key}) : super(key: key) {
    for (var i = 1; i <= _imageCount; i++) {
      _images.add(Image.asset(
        "images/stu_loading_$i.webp",
        gaplessPlayback: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 236.h,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: HookBuilder(
                builder: (context) {
                  final state = useState(1);
                  useEffect(() {
                    var idx = 0;
                    final timer = Timer.periodic(300.milliseconds, (timer) {
                      idx = (idx + 1) % _imageCount;
                      if (state.value != idx) {
                        state.value = idx;
                      }
                    });

                    return timer.cancel;
                  }, [state]);

                  return _images[state.value];
                },
              ),
            ),
          ),
          Text(
            "正在加载...",
            style: TextStyle(color: Colors.white, fontSize: 14.sph),
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
