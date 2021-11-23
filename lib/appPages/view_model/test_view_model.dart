import 'package:flutter_deerclass/net/base_error.dart';
import 'package:flutter_deerclass/net/dio_handle.dart';
import 'package:flutter_deerclass/net/model/user_app_order.dart';
import 'package:flutter_deerclass/net/request_model/user_order_list_params.dart';
import 'package:flutter_deerclass/provider/rest_client.dart';
import 'package:flutter_deerclass/ui/widgets/app_loading_view.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:dio/dio.dart';

import 'view_model_state.dart';

class TestState implements ViewModelState {
  final List<UserAppOrder> userAppOrders;
  final PageState pageState; // 页面状态类
  final NetError? error; // 根据后端返回的错误的错误类

  TestState(this.userAppOrders, this.pageState, this.error);

  TestState.initial()
      : userAppOrders = [],
        pageState = PageState.initializedState,
        error = null;

  TestState copyWith({
    List<UserAppOrder>? userAppOrders,
    PageState? pageState,
    NetError? error,
  }) {
    return TestState(userAppOrders ?? this.userAppOrders,
        pageState ?? this.pageState, error ?? this.error);
  }
}

class TestViewModel extends StateNotifier<TestState> with LoadingViewMix {
  final TTuple<UserOrderListParams> params;
  CancelToken? cancelToken;

  TestViewModel(this.params, [TestState? state])
      : super(state ?? TestState.initial()) {
    // getUserOrderList();
  }

  void dispose() {
    super.dispose();
    cancelToken?.cancel();
  }

  Future<void> getUserOrderList() async {
    if (state.pageState == PageState.initializedState) {
      state = state.copyWith(pageState: PageState.busyState);
    }

    cancelToken?.cancel();
    cancelToken = CancelToken();

    try {
      List<UserAppOrder> list =
          await buildRestClient().getUserOrderList(params.item, cancelToken);

      List<UserAppOrder> oldList =
          params.item.page_number == "1" ? [] : state.userAppOrders;
      oldList.addAll(list);

      state = state.copyWith(
          pageState: PageState.dataFetchState,
          userAppOrders: oldList,
          error: null);
    } on Exception catch (e) {
      state = e.pageExceptionState(state) as TestState;
    }
  }
}
