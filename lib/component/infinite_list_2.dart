import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  final List<Widget> scrollList;
  final Function()? onLoad;
  final Function()? onRefresh;
  /// 除了使用 AutomaticKeepAliveClientMixin 外, 也可以使用PageStorageKey也可以保存滚动位置,
  /// 但是组件多次使用时需要分别使用不同的PageStorageKey来保存状态, 因此这个key需要从外部传.
  /// 没有AutomaticKeepAliveClientMixin方便, 还需要外部传入key
  final PageStorageKey? pageStorageKey;
  const InfiniteListView(this.scrollList, { this.onLoad,  this.onRefresh, this.pageStorageKey, super.key});

  @override
  State<InfiniteListView> createState() {
    return _InfiniteListViewState();
  }
}

// class _InfiniteListViewState extends State<InfiniteListView> with AutomaticKeepAliveClientMixin {
class _InfiniteListViewState extends State<InfiniteListView>  {
  /// ScrollPosition是真正保存滑动位置信息的对象
  ScrollController  scrollController =  ScrollController();


  @override
  void initState() {
    super.initState();
  }

  // @override
  // bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // super.build(context);

    debugPrint('==============執行=build');
    var scrollList = widget.scrollList;
    if(widget.onRefresh != null) {
      return RefreshIndicator(child: ListView.builder(
        key: widget.pageStorageKey,
        // key: UniqueKey(),
        itemCount: widget.scrollList.length + 1,
        addAutomaticKeepAlives: true,
        itemBuilder: (context, index) {

          if(scrollList.length == index) {
            if(widget.onLoad != null) widget.onLoad!();
            return const Center(child: SizedBox(width: 50, height: 50,  child: RefreshProgressIndicator(),));
          }
          return scrollList[index];
        },
      ), onRefresh: () async {
        widget.onRefresh!();
      });

    } else {
      return ListView.builder(
        itemCount: widget.scrollList.length + 1,
        addAutomaticKeepAlives: true,
        itemBuilder: (context, index) {

          if(scrollList.length == index) {
            if(widget.onLoad != null) widget.onLoad!();
            return const RefreshProgressIndicator();
          }
          return scrollList[index];
        },
      );
    }
  }
}