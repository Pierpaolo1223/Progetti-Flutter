import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MemoryPage extends StatefulWidget {
  MemoryPage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyMemoryPageState();
  }
}

class _MyMemoryPageState extends State<MemoryPage> {
  List<String> numeri = [
    "1",
    "1",
    "2",
    "2",
    "3",
    "3",
    "4",
    "4",
    "5",
    "5",
    "6",
    "6",
    "7",
    "7",
    "8",
    "8"
  ];

  List<bool> cliccati = List.generate(16, (index) => false);

  String precedente = "";

  int indiceprecedente = 0;

  bool cliccabili = true;

  bool finito = false;

  int errori = 0;

  List<Widget> testi = List.generate(16, (index) => Text(""));

  @override
  void initState() {
    Random random = Random();
    for (int i = 0; i < numeri.length; i++) {
      int index = random.nextInt(i + 1);
      String a = numeri[index];
      numeri[index] = numeri[i];
      numeri[i] = a;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Memory",style: TextStyle(fontSize: MediaQuery.of(context).size.width/20),),
        ),
        body: Column(children: [
          Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 9)),
          _areAllFieldsNotEmpty(cliccati)?Text("Memory finito con ${errori} errori",style: TextStyle(fontSize: MediaQuery.of(context).size.width/30),):Text("Memory in corso",style: TextStyle(fontSize: MediaQuery.of(context).size.width/30)),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 6,
                right: MediaQuery.of(context).size.width / 6,
                top: MediaQuery.of(context).size.height / 9),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              children: List.generate(
                16,
                (index) => GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                          child: cliccati[index] == true
                              ? Text(numeri[index],style: TextStyle(fontSize: MediaQuery.of(context).size.width/30),)
                              : Text("")),
                    ),
                    onTap: () => {
                          if (cliccabili == true)
                            {
                              if (cliccati[index] == false)
                                {
                                  setState(() {
                                    cliccati[index] = true;
                                    if (precedente.isNotEmpty) {
                                      if (precedente.compareTo(numeri[index]) !=
                                          0) {
                                        cliccabili = false;
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          setState(() {
                                            precedente = "";
                                            cliccati[index] = false;
                                            errori=errori+1;
                                            cliccati[indiceprecedente] = false;
                                            cliccabili = true;
                                          });
                                        });
                                      } else {
                                        precedente = "";
                                      }
                                    } else {
                                      precedente = numeri[index];
                                      indiceprecedente = index;
                                    }
                                  })
                                }
                            }
                          else
                            {null}
                        }),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 35)),
          _areAllFieldsNotEmpty(cliccati)?ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MemoryPage()));
              },
              child: Text("Rigioca")):Container()
        ]));
  }
}

bool _areAllFieldsNotEmpty(List<bool> cliccati) {
  bool tuttiicampipieni = false;

  for (bool cliccato in cliccati) {
    if (cliccato == true) {
      tuttiicampipieni = true;
    } else {
      tuttiicampipieni = false;
      break;
    }
  }

  return tuttiicampipieni;
}
