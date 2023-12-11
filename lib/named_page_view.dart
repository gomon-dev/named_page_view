import 'package:flutter/material.dart';
import 'package:named_page_view/named_page_controller.dart';

class NamedPageView<T extends Enum> extends StatefulWidget {
  final Map<T, Widget> pages;
  final NamedPageController controller;
  final void Function(T page)? onPageChanged;
  const NamedPageView({
    super.key,
    required this.pages,
    required this.controller,
    this.onPageChanged,
  });

  @override
  State<NamedPageView<T>> createState() => _NamedPageViewState<T>();
}

class _NamedPageViewState<T extends Enum> extends State<NamedPageView<T>> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller.pageController,
      children: widget.pages.entries.map((page) => page.value).toList(),
      onPageChanged: (p) {
        if (p >= widget.pages.entries.length) return;

        widget.onPageChanged;
        
        if (widget.onPageChanged != null){
          widget.onPageChanged!(widget.pages.entries.toList()[p].key);
        }
      },
    );
  }
}
