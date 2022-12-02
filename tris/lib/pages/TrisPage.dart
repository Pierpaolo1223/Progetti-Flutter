import 'package:flutter/material.dart';

class TrisPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyTrisPage();
  }
}

class _MyTrisPage extends State<TrisPage> {
  List<bool> cliccati = List.generate(9, (index) => false);
  bool isx = false;
  List<String> values = List.generate(9, (index) => "");
  bool vincitore = false;
  bool trisFinito = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tris"),
        ),
        body: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 5,
                right: MediaQuery.of(context).size.width / 5,
                top: MediaQuery.of(context).size.height / 3.8),
            child: Column(children: [
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                children: List.generate(
                  9,
                  (index) => GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child:Center(
                          child: cliccati[index] == true
                              ? Text("${values[index]}")
                              : Text(""),
                        ),
                      ),
                      onTap: () => {
                            if (cliccati[index] == true || vincitore == true)
                              {null}
                            else
                              {
                                setState(() {
                                  isx = !isx;
                                  if (cliccati[index] == false) {
                                    if (isx == true) {
                                      values[index] = "x";
                                    } else {
                                      values[index] = "0";
                                    }
                                  }
                                  cliccati[index] = true;
                                  vincitore = _vittoria(values);
                                  trisFinito = _trisFinito(values);
                                })
                              },
                          }),
                ),
              ),
              vincitore || trisFinito
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TrisPage()));
                        },
                        child: Text("Rigioca"),
                      ),
                    )
                  : Text(""),

              /*Container(
                width: MediaQuery.of(context).size.width/5,
                height: MediaQuery.of(context).size.height/10,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  //borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
              )*/
            ])));
  }
}

bool _vittoria(List<String> values) {
  //orizzontali
  if (values[0].compareTo("x") == 0 &&
      values[1].compareTo("x") == 0 &&
      values[2].compareTo("x") == 0) {
    return true;
  }

  if (values[3].compareTo("x") == 0 &&
      values[4].compareTo("x") == 0 &&
      values[5].compareTo("x") == 0) {
    return true;
  }

  if (values[6].compareTo("x") == 0 &&
      values[7].compareTo("x") == 0 &&
      values[8].compareTo("x") == 0) {
    return true;
  }

  //verticali
  if (values[0].compareTo("x") == 0 &&
      values[3].compareTo("x") == 0 &&
      values[6].compareTo("x") == 0) {
    return true;
  }

  if (values[1].compareTo("x") == 0 &&
      values[4].compareTo("x") == 0 &&
      values[7].compareTo("x") == 0) {
    return true;
  }

  if (values[2].compareTo("x") == 0 &&
      values[5].compareTo("x") == 0 &&
      values[8].compareTo("x") == 0) {
    return true;
  }

  //obliqui
  if (values[0].compareTo("x") == 0 &&
      values[4].compareTo("x") == 0 &&
      values[8].compareTo("x") == 0) {
    return true;
  }

  if (values[2].compareTo("x") == 0 &&
      values[4].compareTo("x") == 0 &&
      values[6].compareTo("x") == 0) {
    return true;
  }

  //orizzontali
  if (values[0].compareTo("0") == 0 &&
      values[1].compareTo("0") == 0 &&
      values[2].compareTo("0") == 0) {
    return true;
  }

  if (values[3].compareTo("0") == 0 &&
      values[4].compareTo("0") == 0 &&
      values[5].compareTo("0") == 0) {
    return true;
  }

  if (values[6].compareTo("0") == 0 &&
      values[7].compareTo("0") == 0 &&
      values[8].compareTo("0") == 0) {
    return true;
  }

  //verticali
  if (values[0].compareTo("0") == 0 &&
      values[3].compareTo("0") == 0 &&
      values[6].compareTo("0") == 0) {
    return true;
  }

  if (values[1].compareTo("0") == 0 &&
      values[4].compareTo("0") == 0 &&
      values[7].compareTo("0") == 0) {
    return true;
  }

  if (values[2].compareTo("0") == 0 &&
      values[5].compareTo("0") == 0 &&
      values[8].compareTo("0") == 0) {
    return true;
  }

  //obliqui
  if (values[0].compareTo("0") == 0 &&
      values[4].compareTo("0") == 0 &&
      values[8].compareTo("0") == 0) {
    return true;
  }

  if (values[2].compareTo("0") == 0 &&
      values[4].compareTo("0") == 0 &&
      values[6].compareTo("0") == 0) {
    return true;
  } else {
    return false;
  }
}

bool _trisFinito(List<String> values) {
  bool trisFinito = false;
  for (String value in values) {
    if (value.length != 0) {
      trisFinito = true;
    } else {
      trisFinito = false;
      break;
    }
  }
  return trisFinito;
}
