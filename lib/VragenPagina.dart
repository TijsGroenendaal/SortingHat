part of 'main.dart';

class VragenState extends StatefulWidget {
  @override
  State<VragenState> createState() => VragenPagina();
}

class VragenPagina extends State<VragenState> {

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Vraag " + ((currentQ + 1).toString()),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                if (currentQ != 0) {
                  currentQ -= 1;
                  setState(() {});
                }},
              child: Text(
                "Terug",
                style: TextStyle(fontSize: 20,
                    color: Colors.white),
              ))
        ],),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
                child: Center(
                  child: Text(
                    qList[currentQ],
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
            Column(
              children: List.generate(aList.length + aList.length, (index){
                bool chosen;
                int i = index ~/ 2;
                if (currentQ < antwoordenL.length) {
                  if (i == (antwoordenL[currentQ] - 4) * -1 ) {chosen = true;}
                  else {chosen = false;}}
                else {chosen = false;}
                if (index.isOdd) {
                  return Divider(height: 20, thickness: 1 ,color: Colors.white,);
                }

                return FlatButton(
                  onPressed: () {
                    _berekenantwoord(i);
                    if (currentQ != 19) {
                      currentQ += 1;
                    } else if(currentQ == 19) {
                      currentQ = 0;
                      berekenSpec();
                      setSpecialisatie();
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return UitslagState();
                      }));
                      data_version_id += 1;
                      dbHelper.insert();
                    }
                    setState(() {});
                  },
                  child: Text(aList[i], style: TextStyle(fontSize: 30),),
                  color: chosen ? Colors.blueAccent : Colors.blue[400],
                  height: 50,
                  minWidth: 270,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _berekenantwoord(int value) {
    value = (value - 4) * - 1;
    try {
      antwoordenL[currentQ] = value;
    } on RangeError {
      antwoordenL.add(value);
    }
  }
}