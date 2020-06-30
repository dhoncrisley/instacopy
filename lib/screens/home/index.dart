import 'package:flutter/material.dart';
import 'package:instacopy/screens/Camera/index.dart';
import 'package:instacopy/screens/Feed/index.dart';
import 'package:instacopy/screens/Messages.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 1);
  void _setTab(int index) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [Camera(), Feed(this._pageController), Messages(this._pageController)],
      ),
      bottomNavigationBar:
          buildBottomNavigationBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF333333),
      currentIndex: _currentIndex,
      onTap: _setTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white30,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFFFFFFF),
          icon: new Icon(
            Icons.home,
          ),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          title: new Text(''),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.add),
          title: new Text(''),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.favorite),
          title: new Text(''),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.account_circle),
          title: new Text(''),
        )
      ],
    );
  }
}
