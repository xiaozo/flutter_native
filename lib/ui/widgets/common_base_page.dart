import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deerclass/ui/widgets/net_error_widget.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_loading_view.dart';
import 'package:flutter_deerclass/deer_class.dart';

typedef RefreshBuilder = Widget Function(BuildContext context, Widget child);

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

class RefreshBasePage extends CommonBasePage {
  final RefreshBuilder refreshBuilder;

  RefreshBasePage(
      {required this.refreshBuilder,
      Key? key,
      required Widget child,
      required PageState pageState,
      VoidCallback? buttonActionCallback,
      Exception? error})
      : super(
            key: key,
            child: child,
            pageState: pageState,
            buttonActionCallback: buttonActionCallback,
            error: error);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    Widget childWidget = Container();

    if (pageState == PageState.busyState ||
        pageState == PageState.initializedState) {
    } else if (pageState == PageState.emptyDataState ||
        pageState == PageState.errorState) {
      childWidget = NetErrorWidget(
          callback: buttonActionCallback, message: error?.message());
    } else {
      childWidget = child;
    }

    widgets.add(refreshBuilder(context, childWidget));

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
