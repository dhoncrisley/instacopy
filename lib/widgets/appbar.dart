import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget with PreferredSizeWidget {
  HomeBar({Key key}) : super(key: key);

  @override
  _HomeBarState createState() => _HomeBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF222222),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  tooltip: 'Navigation menu',
                  icon: Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  onPressed: () {
                    debugPrint('object');
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Instacopy",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Billabong',
                        fontSize: 24,
                      )),
                )
              ],
            ),
            IconButton(
              icon: Transform.translate(
                offset: Offset(5, -2.5),
                child: Transform.rotate(
                  angle: -.5,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
              ),
              onPressed: () {
                debugPrint('send');
              },
            )
          ],
        ),
      ),
    );
  }
}
