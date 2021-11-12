import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deerclass/ui/widgets/appbar_gradient.dart';
import 'package:flutter_deerclass/ui/widgets/back_buttonv2.dart';
import 'package:flutter_deerclass/ui/widgets/common_base_page.dart';
import 'package:flutter_deerclass/ui/widgets/my_app_bar.dart';

import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';

class TestPage extends StatefulWidget {
  TestPage({
    Key? key,
  }) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: MyAppBar(
          child: GradientAppBar(
            // backgroundColor: Colors.white,
            elevation: 1.0,
            title: Text(
              "练习",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            leading: BackButtonV2(),
          ),
        ),
        body: CommonBasePage(
          pageState: PageState.busyState,
          child: Container(),
        ));
  }
}
