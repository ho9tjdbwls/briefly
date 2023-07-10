import 'dart:async';

import 'package:chat/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mainscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({Key? key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    final String imagelogo = 'assets/images/logoexam.png';

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromRGBO(1, 158, 224, 1),
                    Color.fromRGBO(1, 114, 183, 1)
                  ])),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset(imagelogo),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    "Briefly",
                    style: TextStyle(fontFamily: 'pretendard', fontSize: 16),
                  )
                ],
              ),
            ),
          )),
    );
    ;
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 1500), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Mainscreen()));
    });
  }
}
