import 'package:Sorteerhoed/screens/Home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Sorteerhoed/utils/DatabaseHandler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHandler.initDatabase();

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Sorting Hat",
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Sorting Hat"),
          ),
          body: Center(
            child: HomeScreen(),
          ),
        ),
      )
  );
}
