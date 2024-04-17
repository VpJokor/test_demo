import 'package:flutter/material.dart';

/**
 * 实现PageView子页面缓存功能
 * 用KeepAliveWrapper包裹着需要缓存的子页面即可
 * 参考链接 https://zhuanlan.zhihu.com/p/612669384
 */
// 使用方法
// @override
// Widget build(BuildContext context) {
//   return PageView.builder(
//     itemCount: 5,
//     itemBuilder: (BuildContext ctx, int index) {
//       return KeepAliveWrapper(
//         child: PageItem(text: "$index"),
//         keepAlive: true,
//       );
//     },
//   );
// }
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper(
      {Key? key, @required this.child, this.keepAlive = true})
      : super(key: key);
  final Widget? child;
  final bool keepAlive;
  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
