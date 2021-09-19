import 'package:SortingHat/screens/Home_Screen.dart';
import 'package:SortingHat/utils/AppColors.dart';
import 'package:SortingHat/utils/FirestoreHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SortingHat/utils/DatabaseHandler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHandler.initDatabase();
  FireStoreHandler.initializeFireStore();
  runApp(
      MaterialApp(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors.white,
          primaryColor: AppColors.teal,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColors.teal,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.bluegrotto),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
            ),
          ),
          dividerTheme: DividerThemeData(
            thickness: 1.5,
            endIndent: 30.0,
            indent: 30.0,
          ),
          textTheme: TextTheme(
            bodyText2: TextStyle(
              fontFamily: 'BebasNeue',
              color: Colors.black
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: "Sorting Hat",
        home: HomeScreen(),
      )
  );
}
