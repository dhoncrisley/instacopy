import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(color: Color(0xFF333333), borderRadius: BorderRadius.all(Radius.circular(4))),
        margin: EdgeInsets.all(15),
        child: TextField(
          maxLines: 1,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintText: "First Name",
              hintStyle: TextStyle(color: Colors.white38),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
              )),
          onChanged: (value) {
            debugPrint('value: ' + value);
          },
          textAlignVertical: TextAlignVertical.top,
          style: TextStyle(color: Colors.white, fontSize: 16, height: 1.75),
        ));
  }
}
