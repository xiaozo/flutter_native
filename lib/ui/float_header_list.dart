import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef FloatHeaderListTopBuilder = Widget Function(BuildContext context);

typedef FloatHeaderListCellBuilder = Widget Function(
    BuildContext context, int section, int index);

typedef FloatHeaderListHeaderBuilder = Widget Function(
    BuildContext context, int section);

class _FloatHeadModel {
  final double postion;
  final double epostion;

  _FloatHeadModel(this.postion, this.epostion);
}

class _FloatHeadRange {
  ///该setion的开始index（不包含topview）
  final int bindex;

  ///该setion的结束index（不包含topview）
  final int eindex;

  _FloatHeadRange(this.bindex, this.eindex);
}

class FloatHeaderList extends StatefulWidget {
  final List<List> datas;
  final FloatHeaderListCellBuilder floatHeaderListCellBuilder;
  final FloatHeaderListHeaderBuilder floatHeaderListHeaderBuilder;
  final FloatHeaderListTopBuilder? floatHeaderListTopBuilder;

  FloatHeaderList({
    Key? key,
    required this.datas,
    required this.floatHeaderListCellBuilder,
    required this.floatHeaderListHeaderBuilder,
    this.floatHeaderListTopBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatHeaderListState();
  }
}

class _FloatHeaderListState extends State<FloatHeaderList> {
  final GlobalKey globalKey = GlobalKey();
  // ignore: deprecated_member_use
  final List<GlobalKey> _keys = [];

  // ignore: deprecated_member_use
  final List<_FloatHeadModel> _headerPostions = [];

  // ignore: deprecated_member_use
  final List<_FloatHeadRange> _headerHeadRanges = [];

  int get _listTopWidgetCount {
    return widget.floatHeaderListTopBuilder != null ? 1 : 0;
  }

  int get _allCount {
    return _headerHeadRanges.length > 0
        ? _listTopWidgetCount + _headerHeadRanges.last.eindex + 1
        : 0;
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // print(_scrollController);
    _configData();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _configHeaderData();
    });
  }

  @override
  void didUpdateWidget(FloatHeaderList oldWidget) {
    _configData();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _configHeaderData();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  void _configData() {
    _keys.clear();
    _headerPostions.clear();
    _headerHeadRanges.clear();
    int currentIndex = 0;
    for (List item in widget.datas) {
      _keys.add(GlobalKey());
      _headerHeadRanges
          .add(_FloatHeadRange(currentIndex, currentIndex + item.length));
      currentIndex += item.length + 1;
    }
  }

  void _configHeaderData() {
    _headerPostions.clear();

    int index = 0;
    double offset = _scrollController.offset;
    for (GlobalKey key in _keys) {
      if (key.currentContext == null) {
        ///如果没有得到  就清掉header 不展示header
        _headerPostions.clear();
        break;
      }
      double nextDy = double.maxFinite;

      RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;

      final size = renderBox.size;
      double dy = renderBox
              .localToGlobal(Offset.zero,
                  ancestor: globalKey.currentContext!.findRenderObject())
              .dy +
          offset;

      if (index + 1 < _keys.length) {
        key = _keys[index + 1];
        RenderBox renderBox =
            key.currentContext!.findRenderObject() as RenderBox;

        nextDy = renderBox
                .localToGlobal(Offset.zero,
                    ancestor: globalKey.currentContext!.findRenderObject())
                .dy +
            offset;
      }

      _headerPostions.add(_FloatHeadModel(dy, nextDy - size.height));

      index++;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int currentSection = 0;

    // TODO: implement build
    return Stack(children: List.unmodifiable(
      () sync* {
        yield Scrollbar(
          child: SingleChildScrollView(
              key: globalKey,
              controller: _scrollController,
              child: ListView.builder(
                itemCount: _allCount,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0 && widget.floatHeaderListTopBuilder != null) {
                    ///头部
                    return widget.floatHeaderListTopBuilder!(context);
                  }
                  index -= _listTopWidgetCount;

                  bool isHeader = false;
                  int section = 0;
                  int row = 0;
                  if (_headerHeadRanges[currentSection].bindex <= index &&
                      _headerHeadRanges[currentSection].eindex >= index) {
                    section = currentSection;
                    isHeader =
                        _headerHeadRanges[currentSection].bindex == index;
                    row = index - _headerHeadRanges[currentSection].bindex - 1;
                  } else {
                    ///下一项
                    ///
                    currentSection++;
                    section = currentSection;
                    isHeader =
                        _headerHeadRanges[currentSection].bindex == index;
                    row = index - _headerHeadRanges[currentSection].eindex - 1;
                  }

                  if (isHeader) {
                    return Container(
                      key: _keys[currentSection],
                      child:
                          widget.floatHeaderListHeaderBuilder(context, section),
                    );
                  }
                  return widget.floatHeaderListCellBuilder(
                      context, currentSection, row);
                },
              )),
        );

        for (var i = 0; i < _headerPostions.length; i++) {
          _FloatHeadModel headervalue = _headerPostions[i];
          yield HookBuilder(builder: (BuildContext context) {
            int section = i;
            final scrollController = useMemoized(() => _scrollController);
            final floatHeadModel = useMemoized(() => headervalue);
            final top = useState(
                scrollController.offset <= floatHeadModel.postion
                    ? floatHeadModel.postion - scrollController.offset
                    : (scrollController.offset >= floatHeadModel.epostion
                        ? floatHeadModel.epostion - scrollController.offset
                        : 0));

            useEffect(() {
              VoidCallback listen = () {
                top.value = scrollController.offset <= floatHeadModel.postion
                    ? floatHeadModel.postion - scrollController.offset
                    : (scrollController.offset >= floatHeadModel.epostion
                        ? floatHeadModel.epostion - scrollController.offset
                        : 0);
              };
              scrollController.addListener(listen);
              return () {
                scrollController.removeListener(listen);
              };
            }, const []);
            return Positioned(
                child: widget.floatHeaderListHeaderBuilder(context, section),
                left: 0,
                right: 0,
                top: top.value.toDouble());
          });
        }
      }(),
    ));
  }
}
