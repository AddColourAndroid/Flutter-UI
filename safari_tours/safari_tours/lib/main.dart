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

  var mImageList = [
    ImageViewList(
        'https://i.pinimg.com/originals/7f/af/ed/7fafed5923e197b48f2f63fd3257dbbd.jpg'),
    ImageViewList(
        'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fnicoletrilivas%2Ffiles%2F2018%2F11%2FCheetah-44.jpg'),
    ImageViewList(
        'https://cosmos-production-assets.s3.amazonaws.com/file/spina/photo/15850/image_180724-rhino-thumb.jpg'),
  ];

  void updateButtonBackground(bool isClicked) {
    setState(() {
      isAfrica = isClicked;
      mImageList.clear();

      if (isAfrica) {
        mImageList = [
          ImageViewList(
              'https://i.pinimg.com/originals/7f/af/ed/7fafed5923e197b48f2f63fd3257dbbd.jpg'),
          ImageViewList(
              'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fnicoletrilivas%2Ffiles%2F2018%2F11%2FCheetah-44.jpg'),
          ImageViewList(
              'https://cosmos-production-assets.s3.amazonaws.com/file/spina/photo/15850/image_180724-rhino-thumb.jpg'),
        ];
      } else {
        mImageList = [
          ImageViewList(
              'https://cosmos-production-assets.s3.amazonaws.com/file/spina/photo/15850/image_180724-rhino-thumb.jpg'),
          ImageViewList(
              'https://i.pinimg.com/originals/7f/af/ed/7fafed5923e197b48f2f63fd3257dbbd.jpg'),
          ImageViewList(
              'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fnicoletrilivas%2Ffiles%2F2018%2F11%2FCheetah-44.jpg'),
        ];
      }
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Container(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: mImageList,
                ),
              ),
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
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        imagePlaceHolder(context, 40.0, 40.0),
                    errorWidget: (context, url, error) =>
                        loadingWidget(context, 40.0, 40.0),
                  ),
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

class ImageViewList extends StatelessWidget {
  final String imageUrl;

  ImageViewList(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: 350.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: 350.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.amber[800],
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 350.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.20),
            ),
          ],
        ),
      ),
    );
  }
}
