part of 'main.dart';

class UitslagenState extends StatefulWidget {
  UitslagenState({Key key}) : super(key: key);

  @override
  State<UitslagenState> createState() => UitslagenPagina();
}

class UitslagenPagina extends State<UitslagenState>{

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Je uitslagen"),
        actions: [
          IconButton(icon: Icon(Icons.delete), onPressed: () {
            dbHelper.deleteAll();
            setState(() {});
          },),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: dbHelper.queryAllRows(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData) {
              return Container();}
            List content = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(child: ListTile(
                  title: Text('${content[index]['name'].toString()}', style: TextStyle(fontWeight: FontWeight.w800),),
                  trailing: Wrap(children: [
                    IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.lightBlue,), onPressed: () {
                      specWaardes[0] = content[index]["F"];
                      specWaardes[1] = content[index]["I"];
                      specWaardes[2] = content[index]["S"];
                      specWaardes[3] = content[index]["B"];
                      setSpecialisatie();
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return UitslagState();
                      }));
                    },),
                    IconButton(icon: Icon(Icons.delete, color: Colors.red[400],), onPressed: () {
                      dbHelper.delete(content[index]["_id"]);
                      setState(() {});
                    },)
                  ],)
                  //Text(
                  //    "FICT : " + content[index]['F'].toString() +
                  //    "/  IAT : "  + content[index]['I'].toString() +
                  //    "/  SE : "   + content[index]['S'].toString() +
                  //    "/  BDAM : " + content[index]['B'].toString()
                  //),
                ),);
              }
            );
          },
        )
      ),
    );
  }

}