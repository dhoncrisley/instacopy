import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instacopy/widgets/appbar.dart';

var images = [
  'https://previews.123rf.com/images/mimagephotography/mimagephotography1504/mimagephotography150400180/38947293-close-up-portrait-of-a-happy-young-boy-with-curly-hair-smiling-against-white-background.jpg',
  'https://previews.123rf.com/images/starsstudio/starsstudio1310/starsstudio131000011/22854877-curly-haired-boy-smiling-isolated-on-white.jpg',
  'https://st3.depositphotos.com/3591429/15158/i/1600/depositphotos_151589714-stock-photo-little-boy-smiling.jpg',
  'https://st2.depositphotos.com/1005131/6647/i/950/depositphotos_66474759-stock-photo-emotional-little-boy-smiling.jpg',
  'https://www.stoelzle.com/wp-content/uploads/2018/05/stern-alexander-x.jpg',
  'https://www.stoelzle.com/wp-content/uploads/2017/04/herzog_2-500x600.jpg',
  'https://premiumaddons.b-cdn.net/wp-content/uploads/2018/01/beautiful-woman-smiles.jpg',
  'https://remind-wippermann.imgix.net/bilder/kontakt/ansprechpartner/wippermann-roger-paul.jpg',
  'https://www.westsomersethealthcare.co.uk/website/L85009/files/happy_person.jpg',
  'https://www.clicsargent.org.uk/wp-content/uploads/2018/09/Daisy-Aug2018-770x433-Teensyoungadults-752x433.jpg',
];

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: HomeBar(),
        body: Flex(direction: Axis.vertical, children: <Widget>[
          Stories(),
          FeedList(),
        ]));
  }
}

class Storie extends StatefulWidget {
  final String url;
  final double size;
  final bool showText;
  const Storie({Key key, this.url, this.size = 32.5, this.showText = true}) : super(key: key);
  @override
  _StorieState createState() => _StorieState(url, size, this.showText);
}

class _StorieState extends State<Storie> {
  final String url;
  final double size;
  final bool showText;
  _StorieState(String this.url, this.size, this.showText);

  @override
  Widget build(BuildContext context) {
    debugPrint('size: ' + this.size.toString());
    return GestureDetector(
      onTap: () => {debugPrint('touched!')},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
        child: Flex(direction: showText ? Axis.vertical : Axis.horizontal, children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: this.size,
            child: CircleAvatar(
                radius: this.size - 2.5,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: this.size - 4.5,
                  backgroundImage: NetworkImage(this.url, scale: 1.5),
                )),
          ),
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 2.5, right: 10, left: 10),
            child: Text(
              "Fulano",
              style: TextStyle(color: Colors.white),
            ),
          )),
        ]),
      ),
    );
  }
}

class Stories extends StatefulWidget {
  Stories({Key key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Color(0x33eeeeee)),
        ),
      ),
      height: 100,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.5),
        scrollDirection: Axis.horizontal,
        children: [
          ...images.map((e) => Storie(
                url: e,
                showText: true,
                // size: 32.5,
              ))
        ],
      ),
    );
  }
}

class FeedList extends StatefulWidget {
  FeedList({Key key}) : super(key: key);

  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ListView(
        children: <Widget>[
          ...images.map((e) => FeedItem(
                url: e,
              ))
        ],
      ),
    );
  }
}

class FeedItem extends StatefulWidget {
  final Map data;
  final String url;
  FeedItem({Key key, Map this.data, String this.url}) : super(key: key);

  @override
  _FeedItemState createState() => _FeedItemState(this.data, this.url);
}

class _FeedItemState extends State<FeedItem> {
  final Map data;
  String url;
  _FeedItemState(Map this.data, String this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Storie(url: url, showText: false, size: 20),
              IconButton(
                onPressed: () => {debugPrint('ok')},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Image.network(url),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.chat_bubble,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => {},
                    icon: Transform.rotate(
                        angle: -1,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(images[0]),
                ),
              ),
              Text(
                "Curtido por ",
                style: TextStyle(color: Colors.white),
              ),
              Text("Fulainho", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(' e ', style: TextStyle(color: Colors.white)),
              Text("outras pessoas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Text(
                  "fulainho_ofc: ",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("hue uheuheuheuh ueh uhe  BRBRBR", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
