import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  final String url;
  final double size;

  const Avatar({
    Key key,
    this.url,
    this.size = 32.5,
  }) : super(key: key);
  @override
  _AvatarState createState() => _AvatarState(url, size);
}

const double PRESSED_VALUE = .9;

class _AvatarState extends State<Avatar> with TickerProviderStateMixin {
  double _scale = .95;
  final String url;
  final double size;

  bool pressed = false;
  _AvatarState(String this.url, this.size);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        debugPrint('down');
        setState(() => {_scale = PRESSED_VALUE});
      },
      onPanCancel: () {
        debugPrint('cancel');
        setState(() => {if (_scale != 1) _scale = 1});
      },
      onTapUp: (detail) {
        debugPrint('up');
        setState(() => {if (_scale != 1) _scale = 1});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
        child: TweenAnimationBuilder(
          builder: (BuildContext context, dynamic value, Widget child) {
            return Transform.scale(
              scale: checkDouble(value.toString()),
              child: child,
              alignment: Alignment.center,
            );
          },
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 250),
          // tween: Tween(begin: Size.fromWidth(.5), end: Size.fromHeight(_scale)),
          tween: Tween(begin: 1, end: _scale),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: this.size,
            child: CircleAvatar(
                radius: this.size - 2.5,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: this.size - 4.5,
                  backgroundImage: NetworkImage(this.url),
                )),
          ),
        ),
      ),
    );
  }
}

double checkDouble(dynamic value) {
  if (value is double) {
    return value;
  } else {
    return double.tryParse(value);
  }
}
