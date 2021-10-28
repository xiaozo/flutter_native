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
  late LoadingViewModel? _lvm = LoadingViewModel(LoadingState(false));
  late AutoDisposeStateNotifierProvider<LoadingViewModel, LoadingState>?
      _stateNotifierProvider;

  AutoDisposeStateNotifierProvider<LoadingViewModel, LoadingState>
      loadingStateNotifierProvider() {
    if (_stateNotifierProvider == null) {
      _stateNotifierProvider =
          AutoDisposeStateNotifierProvider<LoadingViewModel, LoadingState>(
              (ref) {
        ref.onDispose(() {
          _stateNotifierProvider = null;
          _lvm = null;
        });
        _lvm = _lvm ?? LoadingViewModel(LoadingState(false));
        return _lvm!;
      });
    }
    return _stateNotifierProvider!;
  }

  showLoading() {
    _lvm?.show();
  }

  hiddenLoading() {
    _lvm?.hidden();
  }
}
