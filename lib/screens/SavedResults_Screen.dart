import 'package:Sorteerhoed/utils/DatabaseHandler.dart';
import 'package:Sorteerhoed/utils/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TestResult_Screen.dart';

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
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _clearDatabaseHandler(),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: DatabaseHandler.queryAllRows(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            List content = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      '${content[index]['name'].toString()}',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.lightBlue,
                          ),
                          onPressed: () => _gotoSavedResultHandler(content, index),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[400],
                          ),
                          onPressed: () {
                            DatabaseHandler.delete(content[index]["_id"]);
                            setState(() {});
                          },
                        )
                      ],
                    )
                  ),
                );
              }
              );
            },
        )
      ),
    );
  }

  _gotoSavedResultHandler(List<dynamic> content, int index) {
    User.specialisationPoints[0] = content[index]["F"];
    User.specialisationPoints[1] = content[index]["I"];
    User.specialisationPoints[2] = content[index]["S"];
    User.specialisationPoints[3] = content[index]["B"];
    User.setSpecialisation();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return TestResultScreen();
        }));
  }

  _clearDatabaseHandler() {
    DatabaseHandler.deleteAll();
    setState(() {});
  }
}
