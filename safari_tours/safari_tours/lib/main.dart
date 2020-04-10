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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
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
            Container(
            ),
          ],
        ),
      ),
    );
  }

  // Circular Image Widget
  Widget circularImage(
      BuildContext context, double height, double width, borderRadius) {
    return CachedNetworkImage(
      imageUrl:
      'https://i.pinimg.com/originals/aa/4a/c5/aa4ac5f3dd5a61a847452ef44398282b.jpg',
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
}