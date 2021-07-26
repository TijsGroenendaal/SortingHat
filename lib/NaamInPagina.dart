part of 'main.dart';

class NaamState extends StatefulWidget {
  @override
  State<NaamState> createState() => NaamPagina();
}

class NaamPagina extends State<NaamState> {

  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Voer je naam in"),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {
            naam = myController.text;
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VragenState();
            }));
          },)
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Voer hier je naam in"
                ),
                maxLength: 20,
                controller: myController,
                onChanged: (text) => {},
              ),
            ),
          ),
        ],
      )
    );
  }

}