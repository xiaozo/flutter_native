import 'package:flutter_deerclass/net/base_error.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';

abstract class ViewModelState {
  ///需要重写 后续
  ViewModelState copyWith({
    PageState? pageState,
    NetError? error,
  }) {
    throw UnimplementedError();
  }
}
