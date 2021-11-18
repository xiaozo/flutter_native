import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deerclass/net/request_model/page.dart';
import 'package:flutter_deerclass/ui/widgets/net_error_widget.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'app_loading_view.dart';
import 'package:flutter_deerclass/deer_class.dart';

class CommonBasePage extends StatelessWidget {
  final Widget child;
  final AutoDisposeStateNotifierProvider<LoadingViewModel, LoadingState>?
      loadingStateNotifierProvider;

  final PageState pageState;
  final VoidCallback? buttonActionCallback;
  final Exception? error;

  const CommonBasePage({
    Key? key,
    required this.pageState,
    required this.child,
    this.buttonActionCallback,
    this.loadingStateNotifierProvider,
    this.error,
  }) : super(key: key);

  Widget loadWidget() {
    return Container(
      color: Colors.transparent,
      child: Align(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.black54,
            child: CupertinoActivityIndicator(
              animating: true,
              radius: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> widgets = [];

    if (pageState == PageState.busyState ||
        pageState == PageState.initializedState) {
    } else if (pageState == PageState.emptyDataState ||
        pageState == PageState.errorState) {
      widgets.add(NetErrorWidget(
          callback: buttonActionCallback, message: error?.message()));
    } else {
      // return child;
      widgets.add(child);
    }
    if (loadingStateNotifierProvider != null) {
      widgets.add(Consumer(builder: (context, watch, _) {
        LoadingState state = watch(loadingStateNotifierProvider!);
        return state.isLoading
            ? loadWidget()
            : Container(
                width: 0,
                height: 0,
              );
      }));
    }
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: widgets,
      ),
    );
  }
}

// typedef RefreshBuilder = Widget Function(BuildContext context, Widget child);
typedef RefreshHandle = void Function(PageState pageState);
typedef RefreshOnLoadingVoidCallback = void Function(RefreshHandle handle);
typedef RefreshOnRefreshVoidCallback = void Function(RefreshHandle handle);
typedef RefreshChanglePageNumCallback = void Function(String pageNum);

class RefreshBasePageController {
  final RefreshController refreshController;
  int pageNum;
  RefreshBasePageController({
    required this.refreshController,
    required this.pageNum,
  });

  void dispose() {
    refreshController.dispose();
  }
}

class RefreshBasePage extends CommonBasePage {
  // final RefreshBuilder refreshBuilder;
  final RefreshBasePageController controller;
  final bool enablePullUp;
  final bool enablePullDown;
  final RefreshChanglePageNumCallback refreshChanglePageNum;
  final RefreshOnLoadingVoidCallback? onLoading;
  final RefreshOnRefreshVoidCallback? onRefresh;

  ///录音播放是否暂停
  int get pageNum {
    return controller.pageNum;
  }

  set pageNum(int pageNum) {
    controller.pageNum = pageNum;
  }

  RefreshBasePage(
      {required this.refreshChanglePageNum,
      required this.controller,
      // required this.refreshBuilder,
      this.onLoading,
      this.onRefresh,
      this.enablePullUp: false,
      this.enablePullDown: true,
      Key? key,
      required Widget child,
      required PageState pageState,
      VoidCallback? buttonActionCallback,
      AutoDisposeStateNotifierProvider<LoadingViewModel, LoadingState>?
          loadingStateNotifierProvider,
      Exception? error})
      : super(
            key: key,
            child: child,
            pageState: pageState,
            buttonActionCallback: buttonActionCallback,
            loadingStateNotifierProvider: loadingStateNotifierProvider,
            error: error);

  void changePageNum(int tpageNum) {
    pageNum = tpageNum;
    refreshChanglePageNum(this.pageNum.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    Widget childWidget = Container();
    RefreshController refreshController = controller.refreshController;

    if (pageState == PageState.busyState ||
        pageState == PageState.initializedState) {
    } else if (pageState == PageState.emptyDataState ||
        pageState == PageState.errorState) {
      childWidget = NetErrorWidget(
          callback: buttonActionCallback, message: error?.message());
    } else {
      childWidget = child;
    }

    widgets.add(SmartRefresher(
      enablePullUp: true,
      enablePullDown: true,
      controller: refreshController,
      child: childWidget,
      onRefresh: () async {
        print("onRefresh");
        refreshController.resetNoData();

        changePageNum(1);

        if (onRefresh != null) {
          onRefresh!((PageState pageState) {
            if (pageState == PageState.errorState) {
              refreshController.refreshCompleted();
              refreshController.loadNoData();
            } else {
              refreshController.refreshCompleted();
              changePageNum(pageNum + 1);
            }
          });
        }
      },
      onLoading: () async {
        print("onLoading");
        if (onLoading != null) {
          onLoading!((PageState pageState) {
            if (pageState == PageState.errorState ||
                pageState == PageState.noMoreDataState) {
              refreshController.loadNoData();
            } else {
              refreshController.loadComplete();
              changePageNum(pageNum + 1);
              ;
            }
          });
        }
      },
    ));

    if (loadingStateNotifierProvider != null) {
      widgets.add(Consumer(builder: (context, watch, _) {
        LoadingState state = watch(loadingStateNotifierProvider!);
        return state.isLoading
            ? loadWidget()
            : Container(
                width: 0,
                height: 0,
              );
      }));
    }
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: widgets,
      ),
    );
  }
}
