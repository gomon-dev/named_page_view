import 'package:flutter/material.dart';

class NamedPageController<T extends Enum> {
  late final PageController pageController;

  NamedPageController({T? initialPage, double viewportFraction = 1.0}) {
    pageController = PageController(
      initialPage: initialPage?.index ?? 0,
      viewportFraction: viewportFraction,
    );
  }

  void nextPage({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeIn,
  }) {
    pageController.nextPage(duration: duration, curve: curve);
  }

  void previousPage({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeIn,
  }) {
    pageController.previousPage(duration: duration, curve: curve);
  }

  void animateToPage(
    T page, {
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeIn,
  }) {
    pageController.animateToPage(
      page.index,
      duration: duration,
      curve: curve
    );
  }

  void jumpToPage(T page) {
    pageController.jumpToPage(page.index);
  }
}
