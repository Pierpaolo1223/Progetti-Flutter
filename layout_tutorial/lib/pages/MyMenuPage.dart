import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../custom_icons_icons.dart';

class MyMenuPage extends StatefulWidget {

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
  List<double> stops = [
    0.0,
    (100 - 97.50) / 100,
    (100 - 97.50) / 100,
    1.0
  ];

  MyMenuPage();

  //MyMenuPage({required this.titolidelmenu,required this.icone,required this.gradient,required this.stops});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyMenuPageState();
  }
}

class _MyMenuPageState extends State<MyMenuPage> {
  bool SimContainerIsPressed = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 70,
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => print(
                        "hai cliccato la parte in alto a sinistra del menu"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ciao utente",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height / 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            Text(
                              "Gestisci account e impostazioni",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.logout,
                        size: MediaQuery.of(context).size.height / 28,
                        color: Colors.white,
                      ),
                      Text(
                        "Esci",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            )),
        Expanded(
          child: ListView(
            children: [
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: widget.gradient,
                      stops: widget.stops,
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            builder: (context) => StatefulBuilder(
                                builder:
                                    (BuildContext context,
                                            StateSetter setState) =>
                                        Stack(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.6,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      30,
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Seleziona il numero",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black87),
                                                          ),
                                                          Icon(
                                                            Icons.close,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              30,
                                                        ),
                                                      ),
                                                      Text(
                                                          "Tieni premuto uno degli elementi per modificare il nome assegnato"),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              30,
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                          onLongPress: () {
                                                            print("Modifica");
                                                            setState(() {
                                                              SimContainerIsPressed =
                                                                  !SimContainerIsPressed;
                                                            });
                                                          },
                                                          child: Stack(
                                                              children: [
                                                                Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      6.3,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3.6,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey,
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10))),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: MediaQuery.of(context).size.height /
                                                                            45),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "SIM",
                                                                          style: TextStyle(
                                                                              color: Colors.red,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: MediaQuery.of(context).size.height / 240)),
                                                                        Text(
                                                                            "3452345124"),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: MediaQuery.of(context).size.height / 240)),
                                                                        Text(
                                                                          "Scade il 26 ago 2023",
                                                                          style: TextStyle(
                                                                              fontSize: MediaQuery.of(context).size.height / 75,
                                                                              color: Color.fromRGBO(95, 95, 95, 100)),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]))
                                                    ])),
                                          ),
                                          !SimContainerIsPressed //se non è stato premuto mostra l'icona
                                              ? Positioned(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3.6,
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      10,
                                                  child: Icon(
                                                    CustomIcons.sim_card,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        13,
                                                  ),
                                                ) : Positioned(
                                              top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                                  3.6,
                                              left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  10,
                                              child: Container()
                                          )
                                        ])))
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 12,
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sim_card,
                                  color: Colors.grey,
                                  size: MediaQuery.of(context).size.height / 20,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                50,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "SIM",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("3452345213")
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                4.5)),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Scadenza SIM"),
                                      Text("26 ago 2023")
                                    ]),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                50)),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.red,
                                  size: MediaQuery.of(context).size.height / 35,
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30),
                        child: _listaMenu(
                            context, widget.titolidelmenu, widget.icone))
                  ]))
            ],
          ),
        ),
      ],
    );
  }
}

Widget _listaMenu(
    BuildContext context, List<String> titolidelmenu, List<Icon> icone) {
  return Column(
    children: List.generate(
        19,
        (index) => Column(
              children: [
                ListTile(
                  leading: icone[index],
                  //Icon(FontAwesome5Brands.youtube,color: Colors.red,),//Icon(Icons.star_border,color: Colors.black,),
                  title: Text(titolidelmenu[index]),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                  ),
                  onTap: () => print("Hai premuto " + titolidelmenu[index]),
                ),
                Divider()
              ],
            )),
  );
}
