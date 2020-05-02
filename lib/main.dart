import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation cardAnimation,
      delayedCardAnimation,
      fabButtonAnimation,
      infoAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: animationController));

    fabButtonAnimation = Tween(begin: 1.0, end: -0.0008).animate(
        CurvedAnimation(
            curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
            parent: animationController));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () {},
              ),
              title: Text(
                'Near Me',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: FlutterLogo(
                    colors: Colors.blue,
                    size: 40.0,
                  ),
                )
              ],
            ),
            body: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        left: 20.0,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0.0, delayedCardAnimation.value * height, 0.0),
                          width: 260.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0.0, cardAnimation.value * height, 0.0),
                          width: 280.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage('assets/girl.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        left: 15.0,
                        top: 320.0,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0.0, infoAnimation.value * height, 0.0),
                          width: 270.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1.0,
                                  spreadRadius: 2.0)
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Kayla',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Image.asset(
                                      'assets/female-gender-icon.png',
                                      height: 20.0,
                                      width: 20.0,
                                    ),
                                    SizedBox(
                                      width: 110.0,
                                    ),
                                    Text(
                                      '5.8km ',
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Fate is wonderful',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(
                      0.0, fabButtonAnimation.value * height, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {},
                        elevation: 0.0,
                        child: Icon(Icons.close, color: Colors.black),
                        backgroundColor: Colors.white,
                      ),
                      Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          border: Border.all(
                              color: Colors.transparent,
                              style: BorderStyle.solid,
                              width: 2.0),
                        ),
                        child: Container(
                          child: Center(
                            child: IconButton(
                              icon: Image.asset(
                                'assets/chat-bubble.jpeg',
                                color: Colors.lightBlueAccent[300],
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        elevation: 0.0,
                        onPressed: () {},
                        child: Icon(Icons.favorite, color: Colors.pink),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
