import 'package:flutter/material.dart';
import 'package:chat/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Briefly',
      home: Mainscreen(),
    );
  }
}

//////////////////////////////////////////////////////////////////Mainpage

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
//////////////////////////////////////////////////////////////////Mainpage function

  bool istoggleOn = false;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    imageList = ImageList.fromJson(imageitem);

    return Scaffold(
        backgroundColor: Colors.white,

//////////////////////////////////////////////////////////////////appBar

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue,
          title: Text(
            '추천 뉴스',
            style: TextStyle(
                fontFamily: 'pretendard',
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.alarm_rounded)),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              Icons.menu_rounded,
              size: 30,
            ),
            SizedBox(
              width: 20.0,
            )
          ],
        ),

//////////////////////////////////////////////////////////////////body

        body: SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////carouselslider
            Stack(
              children: <Widget>[
                Container(
                  height: 200.0,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                    items: imageList!.list!.map((item) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ),
                Align(
                  heightFactor: 22,
                  alignment: Alignment.bottomCenter,
                  child: indicator(),
                ),
              ],
            ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////carouselslider
            SizedBox(
              height: 10.0,
            ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////toggleswitch

            ToggleSwitch(
              customTextStyles: [
                TextStyle(
                    fontFamily: 'pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.w900)
              ],
              minWidth: 130,
              cornerRadius: 30,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              initialLabelIndex: istoggleOn ? 0 : 1,
              totalSwitches: 2,
              centerText: true,
              labels: ["언론사별 뉴스", "분야별 뉴스"],
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  istoggleOn = index == 0;
                });
              },
            ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////toggleswitch

            SizedBox(
              height: 10,
            ),

            if (istoggleOn)
              Container(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////언론사

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/mbc.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "MBC",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/sbs.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "SBS",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/kbs.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "KBS",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/jtbc.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "JTBC",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/ytn.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "YTN",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/tvjosun.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "TV조선",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/yeonhap.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "연합뉴스TV",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/channela.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "채널A",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/josun.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "조선일보",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/donga.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "동아일보",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/joongang.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "중앙일보",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/mail.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "매일경제",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/hanguk.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "한국일보",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    'assets/images/kyeonghyang.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "경향신문",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon:
                                    Image.asset('assets/images/hankyoreh.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "한겨레",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/seoul.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "서울신문",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/munhwa.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "문화일보",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/money.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "머니투데이",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/segye.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "세계일보",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/kukmin.png'),
                                iconSize: 80,
                              ),
                              Text(
                                "국민일보",
                                style: TextStyle(
                                    fontFamily: 'pretendard', fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////언론사

            if (!istoggleOn)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////분야

              Container(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset('assets/images/politics.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "정치",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset('assets/images/economy.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "경제",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/social.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "사회",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/daily.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "생활",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset('assets/images/culture.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "문화",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/it.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "IT",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset('assets/images/science.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "과학",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/world.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "세계",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/kpop.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "연예",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/sports.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "경제",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset('assets/images/weather.png'),
                                  iconSize: 60,
                                ),
                                Text(
                                  "날씨",
                                  style: TextStyle(
                                      fontFamily: 'pretendard', fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ))

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////분야
          ],
        )));
  }

//////////////////////////////////////////////////////////////////functions

  Widget indicator() => Container(
          // alignment: Alignment.center,
          child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 3,
        effect: JumpingDotEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.white,
            dotColor: Colors.white.withOpacity(0.6)),
      ));

  @override
  void iniState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
//////////////////////////////////////////////////////////////////functions

//////////////////////////////////////////////////////////////////carousel_slider

class ImageList {
  List<ImageItem>? list;

  ImageList({this.list});

  factory ImageList.fromJson(Map<String, dynamic> json) {
    var imageList = json['list'] as List<dynamic>;
    List<ImageItem> items = imageList
        .map((item) => ImageItem(
              image: item['image'],
              name: item['name'],
            ))
        .toList();

    return ImageList(list: items);
  }
}

class ImageItem {
  final String image;
  final String name;

  ImageItem({required this.image, required this.name});
}

final imageitem = {
  "list": [
    {"image": "assets/images/image1.png", "name": "image1"},
    {"image": "assets/images/image2.png", "name": "image2"},
    {"image": "assets/images/image3.png", "name": "image3"},
  ]
};
ImageList? imageList;

//////////////////////////////////////////////////////////////////carousel_slider
