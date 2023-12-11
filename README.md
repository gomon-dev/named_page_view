# named_page_view

## Getting Started

Simple Flutter library that create a different implementation to the PageView, and PageController. With this implementations, is possible to create page views and control them using enums, where each enum variable refers to a page.

First, we define an Enum to use as the pages.
```
enum Pagez { 
    page1, 
    page2, 
    page3 
}
```
The definition must be in the same order as it will be used later on the `NamedPageView`.
After, we define an `NamedPageController`:
```
  final controller = NamedPageController<Pagez>(
    initialPage: Pagez.page1,
    viewportFraction: 1.0,
  );
```
We can pass the `viewPortFraction`, and the `initialPage` to the controller. Notice that the `initialPage` receives an instance of the enum that represents the pages.
The usage of the `NamedPageView` is given as the following:

```dart
NamedPageView<Pagez>(
        controller: controller,
        onPageChanged: (page) {
          print('PAGE $page');
        },
        pages: const {
          Pagez.page1: TestPage(label: '1', color: Colors.red),
          Pagez.page2: TestPage(label: '2', color: Colors.blue),
          Pagez.page3: TestPage(label: '3', color: Colors.green),
        },
      ),
```
We pass the `NamedPageController` as a parameter to the `NamedPageView`. The `pages` parameter receives a `Map<Enum, Widget>`, and is where you define wich enum page represents each widget page.
The `onPageChanged` parameter receives a `void Function(Enum page)`, and is called every time the page changes. 