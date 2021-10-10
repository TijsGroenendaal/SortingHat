import 'package:SortingHat/utils/User.dart';
import 'package:flutter/material.dart';
import 'package:SortingHat/utils/DatabaseHandler.dart';
import 'package:SortingHat/screens/TestResult_Screen.dart';

class LocalStoredResultWidget extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<LocalStoredResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Local"),
      ),
      body: FutureBuilder(
        future: DatabaseHandler.queryAllRows(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
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
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                        ),
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.lightBlue,
                            ),
                            onPressed: () => _gotoSavedResultHandler(
                                {
                                  'FICT' : content[index]['FICT'],
                                  'IAT' : content[index]['IAT'],
                                  'SE' : content[index]['SE'],
                                  'BDAM' : content[index]['BDAM'],

                                },
                                content[index]['RESULT'],
                                content[index]['name']),
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
      ),
    );
  }

  _gotoSavedResultHandler(Map<String, int> content, String result, String name) {
    final ResultUser resultUser = ResultUser(
      specialisation: result,
      specialisationPoints: content,
      name: name
    );

    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return TestResultScreen(user: resultUser,);
        }));
  }
}