import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deerclass/appPages/single_child_scroll_view_v1.dart';
import 'package:flutter_deerclass/event/event_bus.dart';
import 'package:flutter_deerclass/net/request_model/page.dart';
import 'package:flutter_deerclass/net/request_model/user_order_list_params.dart';
import 'package:flutter_deerclass/ui/loading_dialog.dart';
import 'package:flutter_deerclass/ui/widgets/app_dialog.dart';
import 'package:flutter_deerclass/ui/widgets/appbar_gradient.dart';
import 'package:flutter_deerclass/ui/widgets/back_buttonv2.dart';
import 'package:flutter_deerclass/ui/widgets/common_base_page.dart';
import 'package:flutter_deerclass/ui/widgets/gradient_button.dart';
import 'package:flutter_deerclass/ui/widgets/my_app_bar.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view_model/test_view_model.dart';
import 'package:flutter_deerclass/deer_class.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_deerclass/pro_global.dart';
import 'package:flutter_boost/flutter_boost.dart';

class _SingleTouchRecognizer extends OneSequenceGestureRecognizer {
  bool scrollEnabled = false;

  _SingleTouchRecognizer();

  @override
  void addPointer(PointerEvent event) {
    startTrackingPointer(event.pointer);
  }

  @override
  void acceptGesture(int pointer) {
    print("object");
  }

  @override
  String get debugDescription => 'custom';

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    resolve(GestureDisposition.rejected);
  }
}

final orderlistProvider = StateNotifierProvider.autoDispose
    .family<TestViewModel, TestState, TTuple<UserOrderListParams>>(
        (ref, params) {
  ref.onDispose(() {
    debugPrint("orderlistProvider-onDispose");
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

  late RefreshBasePageController _refreshController;

  ScrollController _scrollController1 =
      new ScrollController(keepScrollOffset: true);
  ScrollController _scrollController2 =
      new ScrollController(keepScrollOffset: true);

  @override
  void initState() {
    // _scrollController2.addListener(() {
    //   print(_scrollController1.offset.toString());
    // });

    _scrollController1.addListener(() {});

    EventBus.instance.on("event", (arg) {
      if (_scrollController1.offset <= 0) return;

      _scrollController1
          .jumpTo(_scrollController1.offset - (arg["dy"] as double));
    });
    _typeConditions.add(SortCondition(name: '全部', keys: "0", isSelected: true));
    // _typeConditions
    //     .add(SortCondition(name: '待付款', keys: "1", isSelected: false));
    // _typeConditions
    //     .add(SortCondition(name: '已完成', keys: "2", isSelected: false));
    // _typeConditions
    //     .add(SortCondition(name: '已取消', keys: "3", isSelected: false));

    _currentSortCondition = _typeConditions.first;

    _refreshController = RefreshBasePageController(
        refreshController: RefreshController(initialRefresh: true), pageNum: 1);

    p = TTuple<UserOrderListParams>(UserOrderListParams(
        page_number: "1",
        page_size: "10",
        order_status: _currentSortCondition.keys));

    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   Future.delayed(const Duration(milliseconds: 500)).then((val) {
    //     _refreshController.requestRefresh();
    //   });
    // });
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
          // return gestureDetector(index, itemOnTap, context);
          String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
          return Container(
              height: 100,
              child: Listener(
                onPointerUp: (event) {
                  print("手指抬起:$event");
                },
                child: SingleChildScrollView(
                  controller: _scrollController1,
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    height: 200,
                    color: Colors.red,
                    child: SingleChildScrollViewV1(
                      controller: _scrollController2,
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          //动态创建一个List<Widget>
                          children: str
                              .split("")
                              //每一个字母都用一个Text显示,字体为原来的两倍
                              .map((c) => Text(
                                    c,
                                    textScaleFactor: 2.0,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
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
            leading: BackButtonV2(
              onPressed: () {
                showAppDialog(
                  context: context,
                  builder: (context) {
                    return dialog(context,
                        title: Text('提示'),
                        content: Text('确认删除吗？'),
                        actions: [
                          dialogAction(context, "cc", onPressed: () {
                            // showGlobalDialog();
                            BoostNavigator.instance.push("/test_page",
                                withContainer: true,

                                ///如果开启新容器，需要指定opaque为false
                                opaque: false);
                          }),
                          dialogAction(context, "cc1", onPressed: () {
                            Navigator.of(context).pop('ok');
                          }),
                        ]);
                  },
                );
              },
            ),
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
                  dropDownStyle: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12.sph),
                ),
                Expanded(
                    child: RefreshBasePage(
                  error: categories.error,
                  pageState: categories.pageState,
                  onLoading: (RefreshHandle handle) async {
                    await context
                        .read(orderlistProvider(p).notifier)
                        .getUserOrderList();
                    final categories = context.read(orderlistProvider(p));
                    handle(categories.pageState);
                  },
                  onRefresh: (RefreshHandle handle) async {
                    await context
                        .read(orderlistProvider(p).notifier)
                        .getUserOrderList();
                    final categories = context.read(orderlistProvider(p));
                    handle(
                      categories.pageState,
                    );
                  },
                  controller: _refreshController,
                  refreshChanglePageNum: (String pageNum) {
                    p.item = p.item.copyWith(page_number: pageNum);
                  },
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: categories.userAppOrders.length,
                    // item 的个数
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    // 添加分割线
                    itemBuilder: (BuildContext context, int index) {
                      final model = categories.userAppOrders[index];
                      final userObjectOrder = model.object_data!.first;
                      return GestureDetector(
                        onTap: () {
                          // print("order_id:" + model.order_id.toString());
                          debugPrint(ZykjUtils.getTimeStap(
                                  formatData: '2018-11-15 11:15:29')
                              .toString());

                          BoostNavigator.instance.push("/test_page",
                              withContainer: true,

                              ///如果开启新容器，需要指定opaque为false
                              opaque: false);
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              kViewMargin, 10.0.as, kViewMargin, 10.0.as),
                          child: Column(
                            children: [
                              Text(
                                '${model.order_date_name}',
                                style: TextStyle(
                                    fontSize: 12.0.sph,
                                    color: Color(0xFF9b9b9b)),
                              ),
                              Stack(
                                fit: StackFit.loose,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 8.as),
                                    width: double.infinity,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      boxShadow: [AppBoxShadow()],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(kViewMargin,
                                          18.as, kViewMargin, 8.as),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${userObjectOrder.object_name}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 18.sph,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.as,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                '${userObjectOrder.object_subtitle}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 13.sph,
                                                    color: kGrayDarkColor),
                                              )),
                                              Text('￥${userObjectOrder.fee}')
                                            ],
                                          ),
                                          model.order_status! ==
                                                  OrderStatus_finish
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 8.as,
                                                    ),
                                                    Container(
                                                      color: kLineColor,
                                                      width: double.infinity,
                                                      height: 0.5.as,
                                                    ),
                                                    SizedBox(
                                                      height: 8.as,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          "实付金额",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12.as,
                                                              color:
                                                                  kGrayDarkColor),
                                                        ),
                                                        SizedBox(
                                                          width: 5.as,
                                                        ),
                                                        Text(
                                                            '￥${userObjectOrder.fee}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 14.as,
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              : model.order_status ==
                                                      OrderStatus_wait
                                                  ? Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 8.as,
                                                        ),
                                                        Container(
                                                          color: kLineColor,
                                                          width:
                                                              double.infinity,
                                                          height: 0.5.as,
                                                        ),
                                                        SizedBox(
                                                          height: 8.as,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GradientButton(
                                                              // colors: [
                                                              //   kGradientMainBColor,
                                                              //   kgradientMainEColor
                                                              // ],
                                                              onPressed: () {},
                                                              width: 78.as,
                                                              height: 25.as,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          12.0.as)),
                                                              child: Text(
                                                                '立即付款',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12.0.as,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5.as,
                                      right: 0,
                                      child: _statusWidget(
                                          context, model.order_status!)),
                                ],
                              )
                            ],
                          ),
                        ),
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
                    dropDownHeight: 200.as,
                    dropDownWidget: _buildConditionListWidget((value) {
                      _controller.hide();
                      setState(() {
                        _currentSortCondition = value;
                        p.item = p.item
                            .copyWith(order_status: _currentSortCondition.keys);
                        if (_refreshController.refreshController.headerStatus ==
                            RefreshStatus.refreshing) {
                          _refreshController.refreshController.refreshToIdle();
                        }
                        _refreshController.refreshController.requestRefresh();
                      });
                    })),
              ],
            )
          ]);
        }));
  }

  Widget _statusWidget(BuildContext context, int order_status) {
    String title = "";
    Color color = Color(0xFFDCDCDC);

    if (order_status == OrderStatus_wait) {
      title = "待支付";
      color = Theme.of(context).primaryColor;
    } else if (order_status == OrderStatus_finish) {
      title = "已完成";
    } else if (order_status == OrderStatus_cancel) {
      title = "已取消";
    }
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0.as, vertical: 2.as),
        child: Text(
          '${title}',
          style: TextStyle(color: Colors.white, fontSize: 11.as),
        ),
        decoration: new BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0))));
  }

  // Widget _bottomWidget(BuildContext context,) {

  // }
}
