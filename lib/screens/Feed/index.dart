import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instacopy/widgets/Avatar.dart';

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
  final PageController _pageController;
  Feed(
    this._pageController, {
    Key key,
  }) : super(key: key);

  @override
  _FeedState createState() => _FeedState(this._pageController);
}

class _FeedState extends State<Feed> {
  final PageController _pageController;

  _FeedState(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xFF333333),
          leading: IconButton(
            onPressed: () =>
                {_pageController.animateToPage(0, duration: Duration(milliseconds: 250), curve: Curves.easeInOut)},
            icon: Icon(Icons.camera_alt),
          ),
          title: Text(
            'Instacopy',
            style: TextStyle(color: Colors.white, fontSize: 28, fontFamily: "Billabong"),
          ),
          actions: [
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
              onPressed: () =>
                  {_pageController.animateToPage(2, duration: Duration(milliseconds: 250), curve: Curves.easeInOut)},
            )
          ],
        ),
        body: Flex(direction: Axis.vertical, children: <Widget>[
          FeedList(),
        ]));
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
      child: ListView.builder(
          addAutomaticKeepAlives: true,
          padding: EdgeInsets.symmetric(horizontal: 12.5),
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, i) {
            void onPress = () => {debugPrint('Do something')};

            return Column(
              children: [
                Avatar(
                  url: images[i],
                ),
                Center(
                  child: Text(
                    "Fulano",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          }),
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
      child: ListView.builder(
        itemCount: images.length + 1,
        itemBuilder: (_, i) => i == 0
            ? Stories()
            : FeedItem(
                url: images[i],
              ),
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
              Row(
                children: [
                  Avatar(url: url, size: 20),
                  Text("Fulano", style: TextStyle(color: Colors.white)),
                ],
              ),
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
