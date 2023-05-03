import 'package:flutter/material.dart';
import 'package:flutter_application_portfolio/dice.dart';
import 'package:flutter_application_portfolio/myTimer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 하단 네비게이션바를 위한 배열
  int _index = 0;
  List<BottomNavigationBarItem> items = [];
  late Widget bodyPage;
  List<Widget> pages = [
    const MyTimer(),
    const MyTimer(),
    const MyDice(),
    const MyTimer(),
  ];

  void movePage(int page) {
    setState(() {
      _index = page;
      bodyPage = pages[page];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    items.add(const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      activeIcon: Icon(
        Icons.home_filled,
        color: Colors.greenAccent,
      ),
      label: "홈",
      backgroundColor: Colors.greenAccent,
    ));
    items.add(const BottomNavigationBarItem(
      icon: Icon(Icons.access_time_rounded),
      activeIcon: Icon(
        Icons.access_time_rounded,
        color: Colors.red,
      ),
      label: "타이머",
      backgroundColor: Colors.red,
    ));
    items.add(const BottomNavigationBarItem(
      icon: Icon(Icons.checklist_rounded),
      activeIcon: Icon(
        Icons.checklist_rounded,
        color: Colors.yellow,
      ),
      label: "뽑기",
      backgroundColor: Colors.yellow,
    ));
    items.add(const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.comment),
      label: "소개",
      backgroundColor: Colors.blue,
    ));

    // 첫번째 페이지 지정
    bodyPage = const Center(
        child: FaIcon(
      FontAwesomeIcons.delicious,
      size: 40,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: bodyPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.greenAccent,
          onTap: (value) {
            movePage(value);
          },
          currentIndex: _index,
          items: items,
        ),
      ),
    );
  }
}
