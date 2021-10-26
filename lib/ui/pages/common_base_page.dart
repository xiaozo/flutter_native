import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deerclass/ui/pages/app_loading_view.dart';
import 'package:flutter_deerclass/ui/pages/page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonBasePage extends StatelessWidget {
  final Widget child;
  final StateNotifierProvider<LoadingViewModel, LoadingState>?
      loadingStateNotifierProvider;

  final PageState pageState;
  const CommonBasePage(
      {Key? key,
      required this.pageState,
      required this.child,
      this.loadingStateNotifierProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> widgets = [];

    if (loadingStateNotifierProvider != null) {
      widgets.add(Consumer(builder: (context, watch, _) {
        LoadingState state = watch(loadingStateNotifierProvider!);
        return state.isLoading
            ? Positioned(
                child: Container(
                color: Colors.transparent,
                child: Align(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.black54,
                      child: CupertinoActivityIndicator(
                        animating: false,
                        radius: 20,
                      ),
                    ),
                  ),
                ),
              ))
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
