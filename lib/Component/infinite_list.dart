import 'dart:async';
import 'package:flutter/material.dart';

/// 无限列表
/// @description 包含下拉刷新和上划加载
class InfiniteList extends StatefulWidget {
  final List<Widget> _slivers;
  final int _loadThreshold;
  final bool _refresh;
  final FutureOr<void> Function()? _onLoad;
  final FutureOr<void> Function()? _onRefresh;

  /// 构造方法
  /// @param _slivers 子组件
  /// @param loadThreshold 加载阈值
  /// @param refreshEnable 刷新使能
  /// @param onRefresh 刷新回调
  /// @param onLoad 加载回调
  const InfiniteList(this._slivers, {super.key, int loadThreshold = 80, bool refresh = false, FutureOr<void> Function()? onLoad, FutureOr<void> Function()? onRefresh})
      : _loadThreshold = loadThreshold,
        _refresh = refresh,
        _onLoad = onLoad,
        _onRefresh = onRefresh;

  @override
  State<StatefulWidget> createState() => InfiniteListState();
}

/// 状态
class InfiniteListState extends State<InfiniteList> with AutomaticKeepAliveClientMixin {
  bool _loading = false;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() async {
      if (controller.position.pixels > controller.position.maxScrollExtent - widget._loadThreshold) {
        if (widget._onLoad != null && !_loading) {
          setState(() {
            _loading = true;
          });
          await widget._onLoad!();
          setState(() {
            _loading = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    CustomScrollView customScrollView = CustomScrollView(physics: const AlwaysScrollableScrollPhysics(), controller: controller, slivers: [
      ...widget._slivers,
      if (_loading)
        SliverToBoxAdapter(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [RefreshProgressIndicator()],
        ))
    ]);

    return widget._refresh
        ? RefreshIndicator(
            onRefresh: () async {
              if (!_loading) {
                await widget._onRefresh?.call();
              }
            },
            child: customScrollView)
        : customScrollView;
  }

  @override
  bool get wantKeepAlive => true;
}
