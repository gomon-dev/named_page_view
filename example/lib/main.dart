import 'package:flutter/material.dart';
import 'package:named_page_view/named_page_controller.dart';
import 'package:named_page_view/named_page_view.dart';

void main() {
  runApp(const MyApp());
}

enum Pagez { page1, page2, page3 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = NamedPageController<Pagez>(
    initialPage: Pagez.page1,
    viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: NamedPageView<Pagez>(
        controller: controller,
        onPageChanged: (page) {
          print('PAGINA $page');
        },
        pages: const {
          Pagez.page1: TestWdgt(page: '1', color: Colors.red),
          Pagez.page2: TestWdgt(page: '2', color: Colors.blue),
          Pagez.page3: TestWdgt(page: '3', color: Colors.green),
        },
      ),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(
              onPressed: controller.previousPage,
              child: const Text('previous')),
          const Spacer(),
          ElevatedButton(
              onPressed: () => controller.jumpToPage(Pagez.page3),
              child: const Text('Jump to page')),
          const Spacer(),
          ElevatedButton(
              onPressed: controller.nextPage, child: const Text('next')),
        ],
      ),
    );
  }
}

class TestWdgt extends StatelessWidget {
  final String page;
  final Color color;
  const TestWdgt({super.key, required this.page, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(page),
          ],
        ),
      ),
    );
  }
}
