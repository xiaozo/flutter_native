import 'package:pigeon/pigeon.dart';

class FPageVisibility {
  late String uniqueId;
}

// boost的生命周期不准确
// VM 每次显示得时候调用
@FlutterApi()
abstract class PageVisibilityApi {
  void onAppear();
  void onSinglePageAppear(FPageVisibility pageVisibilityParam);
  void onSinglePageDisappear(FPageVisibility pageVisibilityParam);
}
