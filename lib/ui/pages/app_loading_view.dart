import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingState {
  final bool isLoading;

  LoadingState(this.isLoading);

  LoadingState copyWith({
    required bool isLoading,
  }) {
    return LoadingState(isLoading);
  }
}

class LoadingViewModel extends StateNotifier<LoadingState> {
  LoadingViewModel(LoadingState? state) : super(state ?? LoadingState(false));

  void show() {
    state = state.copyWith(isLoading: true);
  }

  void hidden() {
    state = state.copyWith(isLoading: false);
  }
}

mixin LoadingViewMix {
  LoadingViewModel lvm = LoadingViewModel(LoadingState(false));
  late StateNotifierProvider<LoadingViewModel, LoadingState>
      _stateNotifierProvider;

  StateNotifierProvider<LoadingViewModel, LoadingState>
      loadingStateNotifierProvider() {
    if (_stateNotifierProvider == null) {
      _stateNotifierProvider =
          StateNotifierProvider<LoadingViewModel, LoadingState>((_) => lvm);
    }
    return _stateNotifierProvider;
  }

  showLoading() {
    lvm.show();
  }

  hiddenLoading() {
    lvm.hidden();
  }
}
