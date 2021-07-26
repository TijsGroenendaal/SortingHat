import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:path/path.dart' as paths;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

part 'DataHandeler.dart';
part 'GroteVariabelen.dart';
part 'VragenPagina.dart';
part 'UitslagPagina.dart';
part 'UitslagenPagina.dart';
part 'NaamInPagina.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sorteerhoed",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sorteerhoed"),
        ),
        body: Center(
          child: HomeState(),
        ),),);}
}

class HomeState extends StatefulWidget {
  @override
  State<HomeState> createState() => HomePagina();
}

class HomePagina extends State<HomeState> {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlatButton(
          minWidth: 200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.blue,
          height: 70,
          child: Text(
            "Begin Test",
            style: TextStyle(
              fontSize: 25,
            ),),
          onPressed: () {
            if (currentQ != 0) {
              _showDialog();
            } else {
              _resetwaardes();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NaamState();
              }));
            }
          }),
        FlatButton(
          minWidth: 200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.blue,
          height: 70,
          child: Text(
            "Bekijk Uitslag",
            style: TextStyle(
              fontSize: 25,
            ),),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UitslagenState();
            }));
          },
        ),
        SizedBox(
          height: 100,
        )],);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Wil je verder gaan waar je gebleven was?", textAlign: TextAlign.center,),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                color: Colors.blue[400],
                onPressed: () {
                  _resetwaardes();
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VragenState();
                  }));
                },
                child: Text("Nee", style: TextStyle(fontSize: 20),)
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                  color: Colors.blue[400],
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return VragenState();
                    }));
                    },
                  child: Text("Ja", style: TextStyle(fontSize: 20),)
              ),
            ],
          )
        );
      },
    );
  }

  void _resetwaardes() {
    specialisatie = "Onbekend";
    currentQ = 0;
    antwoordenL.clear();
    specWaardes = [0,0,0,0];
  }
}