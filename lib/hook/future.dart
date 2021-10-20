import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// 目的：future缓存，避免反复生成，配合useState(int)的value做key，刷新
AsyncSnapshot<T> useMemoizedFuture<T>(Future<T> Function() create,
    {required T initialData,
    // key
    List<dynamic> keys = const <dynamic>[],
    bool preserveState = true}) {
  final future = useMemoized(create, keys);
  return useFuture(future,
      initialData: initialData, preserveState: preserveState);
}
