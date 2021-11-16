import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deerclass/net/request_model/user_order_list_params.dart';
import 'package:flutter_deerclass/ui/widgets/appbar_gradient.dart';
import 'package:flutter_deerclass/ui/widgets/back_buttonv2.dart';
import 'package:flutter_deerclass/ui/widgets/common_base_page.dart';
import 'package:flutter_deerclass/ui/widgets/my_app_bar.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view_model/test_view_model.dart';

final orderlistProvider = StateNotifierProvider.autoDispose
    .family<TestViewModel, TestState, UserOrderListParams>((ref, params) {
  ref.onDispose(() {
    print("orderlistProvider-onDispose");
  });
  return TestViewModel(params);
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
  late GZXDropdownMenuController _controller = GZXDropdownMenuController();

  GlobalKey _stackKey = GlobalKey();
  @override
  void initState() {
    p = UserOrderListParams(
        page_number: "1", page_size: "10", order_status: "0");

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildConditionListWidget() {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 3,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        return Text("fffff");
      },
    );
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
          final testViewModel = watch(orderlistProvider(p).notifier);
          final categories = watch(orderlistProvider(p));
          return CommonBasePage(
              loadingStateNotifierProvider:
                  testViewModel.loadingStateNotifierProvider(),
              pageState: categories.pageState,
              error: categories.error,
              child: Stack(
                key: _stackKey,
                children: [
                  Column(
                    children: [
                      GZXDropDownHeader(
                        items: [GZXDropDownHeaderItem("t")],
                        controller: _controller,
                        stackKey: _stackKey,
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.red,
                      ))
                    ],
                  ),
                  GZXDropDownMenu(
                    animationMilliseconds: 200,
                    controller: _controller,
                    menus: [
                      GZXDropdownMenuBuilder(
                          dropDownHeight: 200,
                          dropDownWidget: _buildConditionListWidget()),
                    ],
                  )
                ],
              ));
        }));
  }
}
