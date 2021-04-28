import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_ui/leopard_page.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset;
  double _page;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page;
      notifyListeners();
    });
  }

  double get offset => _offset;
}

class MainPage2 extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
          body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            children: [
              LeopardPage(),
              VulturePage(),
            ],
          ),
        ],
      )),
    );
  }
}

class LeopardTmage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Image.asset('assets/leopard.png'),
    );
  }
}

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/leopard.png');
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/vulture.png');
  }
}
