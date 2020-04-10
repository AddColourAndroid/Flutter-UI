import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safari Tours',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        fontFamily: 'NotoSerif',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isAfrica = true;

  void updateButtonBackground(bool isClicked) {
    setState(() {
      isAfrica = isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Safari Tours',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        brightness: Brightness.dark,
        backgroundColor: Colors.brown,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Safari\nTours 2020',
                      style: TextStyle(fontSize: 36.0),
                    ),
                  ),
                  circularImage(context, 64.0, 64.0, 20.0),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateButtonBackground(true);
                    },
                    child: horizontalButtons(
                        context,
                        'Africa',
                        'https://purepng.com/public/uploads/large/map-of-africa-eqe.png',
                        10,
                        isAfrica ? Colors.brown : Color(0xffa1887f)),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateButtonBackground(false);
                    },
                    child: horizontalButtons(
                        context,
                        'Australia',
                        'https://i0.wp.com/freepngimages.com/wp-content/uploads/2014/09/australia.png?fit=571%2C494',
                        7,
                        !isAfrica ? Colors.brown : Color(0xffa1887f)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Circular Image Widget
  Widget circularImage(
      BuildContext context, double height, double width, borderRadius) {
    return CachedNetworkImage(
      imageUrl: 'https://pescart.com/wp-content/uploads/2017/03/DSC06344.jpg',
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.brown,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => imagePlaceHolder(context, height, width),
      errorWidget: (context, url, error) =>
          loadingWidget(context, height, width),
    );
  }

  // Image Placeholder
  Widget imagePlaceHolder(BuildContext context, double height, double width) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.amber[800],
        ),
      ),
    );
  }

  // Image Loading Widget
  Widget loadingWidget(BuildContext context, double height, double width) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      ),
    );
  }

  // Horizontal Buttons
  Widget horizontalButtons(BuildContext context, String name, String imageUrl,
      int number, Color color) {
    return Container(
      height: 72.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: color,
        elevation: 0.0,
        child: Row(
          children: <Widget>[
            Container(
              height: 64.0,
              width: 64.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Color.fromRGBO(211, 211, 211, 211),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '$number',
                style: TextStyle(color: Colors.white30, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
