import 'package:flutter_deerclass/channel/net_channel_all.dart';
import 'package:flutter_deerclass/net/dio_interceptors.dart';
import 'package:flutter_deerclass/net/model/user_app_order.dart';
import 'package:flutter_deerclass/net/request_model/user_order_list_params.dart';
import 'package:flutter_deerclass/net/rest_api.dart';
import 'package:flutter_deerclass/provider/rest_client.dart';
import 'package:flutter_deerclass/ui/widgets/app_loading_view.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:dio/dio.dart';

class TestState {
  final List<UserAppOrder> userAppOrders;
  final PageState pageState; // 页面状态类
  final Exception? error; // 根据后端返回的错误的错误类

  TestState(this.userAppOrders, this.pageState, this.error);

  TestState.initial()
      : userAppOrders = [],
        pageState = PageState.initializedState,
        error = null;

  TestState copyWith({
    List<UserAppOrder>? userAppOrders,
    PageState? pageState,
    Exception? error,
  }) {
    return TestState(userAppOrders ?? this.userAppOrders,
        pageState ?? this.pageState, error ?? this.error);
  }
}

class TestViewModel extends StateNotifier<TestState> with LoadingViewMix {
  final TTuple<UserOrderListParams> params;

  TestViewModel(this.params, [TestState? state])
      : super(state ?? TestState.initial()) {
    // getUserOrderList();
  }

  Future<void> getUserOrderList() async {
    if (state.pageState == PageState.initializedState) {
      state = state.copyWith(pageState: PageState.busyState);
    }

    try {
      List<UserAppOrder> list =
          await buildRestClient().getUserOrderList(params.item);
      state = state.copyWith(
        userAppOrders: list,
        pageState: PageState.dataFetchState,
      );
    } catch (e) {
      state = state.copyWith(
          pageState: PageState.errorState, error: e as Exception);
    }
  }
}
