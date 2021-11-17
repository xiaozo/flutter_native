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
import 'package:flutter_deerclass/deer_class.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final orderlistProvider = StateNotifierProvider.autoDispose
    .family<TestViewModel, TestState, TTuple<UserOrderListParams>>(
        (ref, params) {
  ref.onDispose(() {
    print("orderlistProvider-onDispose");
  });
  return TestViewModel(params);
});

class SortCondition {
  String name;
  String keys;
  bool isSelected;

  SortCondition({
    required this.name,
    required this.keys,
    required this.isSelected,
  });
}

class TestPage extends StatefulWidget {
  TestPage({
    Key? key,
  }) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late TTuple<UserOrderListParams> p;
  late GZXDropdownMenuController _controller = GZXDropdownMenuController();

  GlobalKey _stackKey = GlobalKey();

  late SortCondition _currentSortCondition;
  List<SortCondition> _typeConditions = [];

  late RefreshController _refreshController;

  @override
  void initState() {
    _typeConditions.add(SortCondition(name: '全部', keys: "0", isSelected: true));
    _typeConditions
        .add(SortCondition(name: '待付款', keys: "1", isSelected: false));
    _typeConditions
        .add(SortCondition(name: '已完成', keys: "2", isSelected: false));
    _typeConditions
        .add(SortCondition(name: '已取消', keys: "3", isSelected: false));

    _currentSortCondition = _typeConditions.first;

    _refreshController = RefreshController(initialRefresh: true);

    p = TTuple<UserOrderListParams>(UserOrderListParams(
        page_number: "1",
        page_size: "10",
        order_status: _currentSortCondition.keys));

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Widget _buildConditionListWidget(
      void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _typeConditions.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        return gestureDetector(index, itemOnTap, context);
      },
    );
  }

  GestureDetector gestureDetector(int index,
      void itemOnTap(SortCondition sortCondition), BuildContext context) {
    SortCondition goodsSortCondition = _typeConditions[index];
    return GestureDetector(
      onTap: () {
        for (var value in _typeConditions) {
          value.isSelected = false;
        }
        goodsSortCondition.isSelected = true;

        itemOnTap(goodsSortCondition);
      },
      child: Container(
        //            color: Colors.blue,
        height: 45.as,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: kViewMargin,
            ),
            Expanded(
              child: Text(
                goodsSortCondition.name,
                style: TextStyle(
                  color: goodsSortCondition.isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                ),
              ),
            ),
            goodsSortCondition.isSelected
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  )
                : SizedBox(),
            SizedBox(
              width: kViewMargin,
            ),
          ],
        ),
      ),
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
          // final testViewModel = watch(orderlistProvider(p).notifier);
          final categories = watch(orderlistProvider(p));

          return Stack(key: _stackKey, children: [
            Column(
              children: [
                GZXDropDownHeader(
                  items: [GZXDropDownHeaderItem(_currentSortCondition.name)],
                  controller: _controller,
                  stackKey: _stackKey,
                  style: TextStyle(color: Color(0xFF666666), fontSize: 12.sph),
                ),
                Expanded(
                    child: RefreshBasePage(
                  pageState: categories.pageState,
                  refreshBuilder: (BuildContext context, Widget child) {
                    return SmartRefresher(
                      enablePullUp: true,
                      enablePullDown: true,
                      controller: _refreshController,
                      child: child,
                      onRefresh: () async {
                        print("onRefresh");
                        await context
                            .read(orderlistProvider(p).notifier)
                            .getUserOrderList();
                        _refreshController.refreshCompleted();
                      },
                      onLoading: () {
                        print("object");
                      },
                    );
                  },
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: categories.userAppOrders.length,
                    // item 的个数
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1.0),
                    // 添加分割线
                    itemBuilder: (BuildContext context, int index) {
                      final model = categories.userAppOrders[index];
                      return Container(
                        height: 100,
                        child: Text("ccc:${model.total_pay}"),
                      );
                    },
                  ),
                )),
              ],
            ),
            GZXDropDownMenu(
              animationMilliseconds: 200,
              controller: _controller,
              menus: [
                GZXDropdownMenuBuilder(
                    dropDownHeight: 45.as * _typeConditions.length,
                    dropDownWidget: _buildConditionListWidget((value) {
                      _controller.hide();
                      setState(() {
                        _currentSortCondition = value;
                        p.item = p.item
                            .copyWith(order_status: _currentSortCondition.keys);

                        _refreshController.requestRefresh();
                      });
                    })),
              ],
            )
          ]);
        }));
  }
}
