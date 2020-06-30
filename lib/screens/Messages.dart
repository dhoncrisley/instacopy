import 'package:flutter/material.dart';
import 'package:instacopy/screens/Feed/index.dart';
import 'package:instacopy/widgets/Avatar.dart';
import 'package:instacopy/widgets/SearchBar.dart';

var directs = images;

class Messages extends StatefulWidget {
  final PageController _pageController;
  Messages(this._pageController, {Key key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState(this._pageController);
}

class _MessagesState extends State<Messages> {
  final PageController _pageController;
  _MessagesState(this._pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        leading: IconButton(
          onPressed: () =>
              {this._pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.easeInOut)},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Title(color: Colors.white, child: Text('Direct')),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.movie,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
            itemCount: directs.length,
            itemBuilder: (_, i) => i == 0
                ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SearchBar(),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 15, right: 15, left: 15),
                      child: Text(
                        "Mensagens",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ])
                : DirectItem(url: directs[i])),
      ),
    );
  }
}

class DirectItem extends StatelessWidget {
  final dynamic url;
  const DirectItem({String this.url, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Avatar(
              url: this.url,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fulano',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: 250,
                  child: Text(
                    'descrição ouhd ouqwduoh 2d12d12d 2d d 2d ',
                    overflow: TextOverflow.ellipsis,
                    locale: Locale('pt', 'BR'),
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                )
              ],
            )
          ]),
          Center(
              child: IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ))
        ],
      ),
    );
  }
}
