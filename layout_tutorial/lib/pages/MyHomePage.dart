import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:layout_tutorial/pages/MyMenuPage.dart';

import '../custom_icons_icons.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<int> indiciselezionati = [0];
  List<String> titoli = [
    "Storia delle emoji",
    "Fra!x happy",
    "Programma fedeltà",
    "Gadget tech",
    "Auto elettriche",
    "il nuovo Happy"
  ];
  List<Icon> icone = [
    Icon(
      CustomIcons.youtube,
      color: Colors.red,
    ),
    Icon(
      CustomIcons.star_empty,
      color: Colors.black,
    ),
    Icon(CustomIcons.check, color: Colors.black),
    Icon(CustomIcons.emo_happy, color: Colors.black),
    Icon(Icons.add, color: Colors.black),
    Icon(CustomIcons.payment, color: Colors.black),
    Icon(Icons.add, color: Colors.black),
    Icon(Icons.add, color: Colors.black),
    Icon(CustomIcons.sim_card, color: Colors.black),
    Icon(CustomIcons.computer, color: Colors.black),
    Icon(CustomIcons.flight, color: Colors.black),
    Icon(CustomIcons.security, color: Colors.black),
    Icon(CustomIcons.umbrella, color: Colors.black),
    Icon(CustomIcons.popcorn_svgrepo_com, color: Colors.black),
    Icon(Icons.add, color: Colors.black),
    Icon(CustomIcons.gauge, color: Colors.black),
    Icon(CustomIcons.shop, color: Colors.black),
    Icon(CustomIcons.edit, color: Colors.black),
    Icon(CustomIcons.people, color: Colors.black),
  ];
  List<String> titolidelmenu = [
    "Vodafone Stories",
    "Scopri nuove offerte",
    "Le mie offerte attive",
    "Happy",
    "Ricarica",
    "Metodo di pagamento",
    "Le mie spese",
    "Storico ricariche",
    "Info SIM e PUK",
    "Stato pratica",
    "Quando sei in viaggio",
    "Sicurezza digitale",
    "Assicurazione Smartphone",
    "Vodafone Entertainment",
    "Mappe di copertura",
    "Speed test",
    "Trova negozio",
    "Consensi Privacy",
    "Vodafone People"
  ];
  bool isPositionedMenuPageVisible = true;
  List<Color> gradient = [
    Colors.red,
    Colors.red,
    Colors.white,
    Colors.white,
  ];
  List<double> stops = [0.0, (100 - 97.50) / 100, (100 - 97.50) / 100, 1.0];

  @override
  void initState() {
    BackButtonInterceptor.add(myInterceptor);
    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (stopDefaultButtonEvent) return false;
    print(indiciselezionati);
    setState(() {
      if (indiciselezionati.length != 1) {
        indiciselezionati.removeAt(indiciselezionati.length - 1);
      } else {
        SystemNavigator.pop();
      }
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color.fromRGBO(30, 30, 30, 100),
          backgroundColor: Colors.white,
          currentIndex: indiciselezionati[indiciselezionati.length - 1],
          selectedItemColor: Colors.red,
          onTap: (int index) {
            setState(() {
              if (indiciselezionati[indiciselezionati.length - 1] != index) {
                indiciselezionati.add(selectedIndex);
                indiciselezionati[indiciselezionati.length - 1] = index;
                print(indiciselezionati[indiciselezionati.length - 1]);
              } else
                null;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star),
              label: 'Offerte',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell),
              label: 'Notifiche',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Menu',
            ),
          ],
        ),
        body: NotificationListener<UserScrollNotification>(
            //handle dello scrolling
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                //se scrolli verso l'alto
                setState(() {
                  isPositionedMenuPageVisible = true;
                });
              } else if (notification.direction == ScrollDirection.reverse) {
                //se scrolli verso il basso
                setState(() {
                  isPositionedMenuPageVisible = false;
                });
              }
              return true;
            },
            child: SafeArea(
                child: indiciselezionati[indiciselezionati.length - 1] == 0
                    ? RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(Duration(seconds: 2));
                        },
                        color: Colors.red,
                        backgroundColor: Colors.white,
                        triggerMode: RefreshIndicatorTriggerMode.onEdge,
                        child: NotificationListener<
                                OverscrollIndicatorNotification>(
                            //handle dell'overscroll
                            onNotification: (overscroll) {
                              overscroll
                                  .disallowIndicator(); //togli il glow blu se la lista è finita.
                              return true;
                            },
                            child: SingleChildScrollView(
                                child: _homePage(context, titoli))))
                    : indiciselezionati[indiciselezionati.length - 1] == 3
                        ? NotificationListener<OverscrollIndicatorNotification>(
                            //handle dell'overscroll
                            onNotification: (overscroll) {
                              overscroll
                                  .disallowIndicator(); //togli il glow blu se la lista è finita.
                              return true;
                            },
                            child: MyMenuPage())
                        : Container())));
  }
}

Widget listaProva(BuildContext context, int index, List<String> titoli) {
  return Row(children: [
    Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Center(
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.5,
                  )),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 130),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width / 6,
          child: Text(
            titoli[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height / 75,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
        ),
        index != 5
            ? Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 8))
            : Container(),
      ],
    )
  ]);
}

Widget listaTextSottoICerchi(
    BuildContext context, int index, List<String> titoli) {
  return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 200,
        left: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Container(
          height: 30,
          width: 50,
          child: Text(
            titoli[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height / 85,
            ),
            textAlign: TextAlign.center,
          )));
}

Widget _homePage(BuildContext context, List<String> titoli) {
  return Stack(
    children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.04,
                          top: MediaQuery.of(context).size.width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "./lib/images/1020px-Vodafone_icon.svg.png",
                            height: MediaQuery.of(context).size.height / 30,
                            width: MediaQuery.of(context).size.width / 15,
                          ),
                          /*Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                ),*/
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "SIM",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "3335321352",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              /*Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context)
                                        .size
                                        .width /
                                100)),*/
                              Icon(
                                Icons.sim_card,
                                size: MediaQuery.of(context).size.height / 25,
                                color: Colors.white,
                              )
                              /*Image.asset(
                                "./lib/images/icona_sim-removebg-preview.png",
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 15,
                              )*/
                              /*Icon(
                              Icons.ac_unit_outlined,
                              color: Colors.white,
                            )*/
                            ],
                          )
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 35,
                      left: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                            children: List.generate(6, (index) {
                          return listaProva(context, index, titoli);
                        }))),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1.3,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ]),
      /*SingleChildScrollView(
            child: Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),child: Container(
              height: MediaQuery.of(context).size.height * 1.3,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(children: [],),
            )),
          ),*/
      Positioned(
          top: MediaQuery.of(context).size.height / 4.6,
          left: MediaQuery.of(context).size.width * 0.04,
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 2.5,
          left: MediaQuery.of(context).size.width * 0.04,
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width * 0.42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 2.5,
          left: MediaQuery.of(context).size.width * 0.54,
          child: Container(
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width * 0.42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 2.02,
          left: MediaQuery.of(context).size.width * 0.54,
          child: Container(
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width * 0.42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 1.7,
          left: MediaQuery.of(context).size.width * 0.04,
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
        top: MediaQuery.of(context).size.height / 1.4,
        left: MediaQuery.of(context).size.width * 0.04,
        child: Text(
          "Continua a esplorare",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height / 30),
        ),
      ),
      Positioned(
          top: MediaQuery.of(context).size.height / 1.3,
          left: MediaQuery.of(context).size.width * 0.04,
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 1.05,
          left: MediaQuery.of(context).size.width * 0.04,
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 0.882,
          left: MediaQuery.of(context).size.width * 0.04,
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 0.76,
          left: MediaQuery.of(context).size.width * 0.04,
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )),
    ],
  );
}

/*class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [];
  int perPageItem = 16;
  int pageCount = 0;
  int selectedIndex = 0;
  int lastPageItemLength = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    for (int i = 1; i <= 45; i++) {
      list.add('$i');
    }
    var num = (list.length / perPageItem);
    pageCount = num.isInt ? num.toInt() : num.toInt() + 1;

    var reminder = list.length.remainder(perPageItem);
    lastPageItemLength = reminder == 0 ? perPageItem : reminder;

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paginated listView"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 390,
            child: PageView.builder(
                controller: pageController,
                itemCount: pageCount,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (_, pageIndex) {
                  return GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    primary: false,
                    childAspectRatio: 1.1,
                    shrinkWrap: true,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 4,
                    children: List.generate(
                        (pageCount - 1) != pageIndex
                            ? perPageItem
                            : lastPageItemLength, (index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.all(5),
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: Text(
                            list[index + (pageIndex * perPageItem)],
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      );
                    }),
                  );
                }),
          ),

          SizedBox(
            height: 15,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pageCount,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red
                            .withOpacity(selectedIndex == index ? 1 : 0.5)),
                    margin: EdgeInsets.all(5),
                    width: 10,
                    height: 10,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}*/
