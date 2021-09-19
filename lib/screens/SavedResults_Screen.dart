
import 'package:SortingHat/widgets/FirestoreSavedResult_Widget.dart';
import 'package:SortingHat/widgets/LocalStoredResult_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedResultsScreen extends StatefulWidget {
  SavedResultsScreen({Key key}) : super(key: key);

  @override
  State<SavedResultsScreen> createState() => _SavedResultsState();
}

class _SavedResultsState extends State<SavedResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your results"),
      ),
      body: PageView(
        children: [
          Center(
            child: LocalStoredResultWidget(),
          ),
          Center(
            child: FirestoreSavedResultWidget(),
          )
        ],
      ),
    );
  }
}
