import 'package:SortingHat/screens/TestResult_Screen.dart';
import 'package:SortingHat/utils/FirestoreHandler.dart';
import 'package:SortingHat/utils/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreSavedResultWidget extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<FirestoreSavedResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Online"),
      ),
      body: StreamBuilder(
        stream: FireStoreHandler.firebaseApp.collection("results").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          List<QueryDocumentSnapshot> content = snapshot.data.docs;
          return ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                bool isUser = content[index]['uid'] == FirebaseAuth.instance.currentUser.uid;

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
                            onPressed: () => isUser ?
                              _onlineDeleteHandler(content[index].reference) :
                              () {},
                            icon: Icon(
                              Icons.delete,
                              color: isUser ? Colors.red : Colors.grey,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.lightBlue,
                            ),
                            onPressed: () => _gotoSavedResultHandler(content[index]['points'], content[index]['result'], content[index]['name']),
                          ),
                        ],
                      )
                  ),
                );
              }
          );
        }
      ),
    );
  }

  _onlineDeleteHandler(DocumentReference documentReference) {
    documentReference.delete();
  }

  _gotoSavedResultHandler(Map<String, dynamic> content, String result, String name) {
    final ResultUser resultUser = ResultUser(
      specialisation: result,
      specialisationPoints: content,
      name: name,
    );

    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return TestResultScreen(user: resultUser,);
        }));
  }
}