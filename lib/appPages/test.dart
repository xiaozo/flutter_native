import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deerclass/net/request_model/user_order_list_params.dart';
import 'package:flutter_deerclass/ui/widgets/appbar_gradient.dart';
import 'package:flutter_deerclass/ui/widgets/back_buttonv2.dart';
import 'package:flutter_deerclass/ui/widgets/common_base_page.dart';
import 'package:flutter_deerclass/ui/widgets/my_app_bar.dart';

import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';
import 'package:hooks_riverpod/all.dart';

import 'view_model/test_view_model.dart';

// final postsProvider = StateNotifierProvider.autoDispose
//     .family<TestViewModel, UserOrderListParams>(ref, params) {
//   DetailsViewModel d = DetailsViewModel(params);
//   ref.onDispose(() {
//     StatusBarUtil.setStatusBar(Brightness.dark);
//   });
//   return d;
// };

final postsProvider =
    StateNotifierProvider.family<TestViewModel, TestState, UserOrderListParams>(
        (ref, params) {
  return TestViewModel(params as UserOrderListParams);
});

class TestPage extends StatefulWidget {
  TestPage({
    Key? key,
  }) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late UserOrderListParams p;

  @override
  void initState() {
    p = UserOrderListParams(page_num: "1", page_size: "10", order_status: "0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: MyAppBar(
          child: GradientAppBar(
            elevation: 1.0,
            title: MyAppNavTitle(
              title: '我的订单',
            ),
            leading: BackButtonV2(),
          ),
        ),
        body: Consumer(builder: (context, watch, _) {
          final categories = watch(postsProvider(p));

          return Container();
        }));
  }
}
