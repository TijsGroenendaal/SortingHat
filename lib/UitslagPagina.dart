part of 'main.dart';

class UitslagState extends StatefulWidget {
  UitslagState({Key key}) : super(key: key);

  @override
  State<UitslagState> createState() => UitslagPagina();
}

void setSpecialisatie() {
  int hoogste = specWaardes.reduce(max);

  if (hoogste != 0) {
    int index = specWaardes.indexOf(hoogste);
    if (index == 0) {
      specialisatie = "Forensische ICT";
    } else if (index == 1) {
      specialisatie = "Interactie Technologie";
    } else if (index == 2) {
      specialisatie = "Software Engineering";
    } else if (index == 3) {
      specialisatie = "Business Data Managment";
    }
  }
}

void berekenSpec() {
  for (int i = 0; i < 20; i++) {
    for (int o = 0; o < 4; o++) {
      int temp = antwoordenL[i] * pList[i][o];
      specWaardes[o] = temp + specWaardes[o];
    }
  }

  for (int i = 0; i < 4; i++) {
    double temp = (specWaardes[i] / specMax[i]) * 100;
    specWaardes[i] = temp ~/ 1;
  }
}

class UitslagPagina extends State<UitslagState> {

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {

    var data = [
      PPerSpec("FICT", specWaardes[0]),
      PPerSpec("IAT" , specWaardes[1]),
      PPerSpec("SE"  , specWaardes[2]),
      PPerSpec("BDAM", specWaardes[3]),
    ];

    var series = [
      charts.Series(
        domainFn: (PPerSpec percentage, _) => percentage.specialisatie,
        measureFn: (PPerSpec percentage, _) => percentage.percentage,
        data: data,
        labelAccessorFn: (PPerSpec percentage, _) => '${percentage.percentage.toString()} %',
        id: "Percentage",
      )
    ];

    var chart = charts.BarChart(
      series,
      animate: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 300,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Je Uitslag"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      specialisatie,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Text("Hieronder staat je uitslag in percentages\n\n Hoe Hoger de percentage hoe Beter je er bij past.", textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
            chartWidget
          ],
        ),
      ),
    );
  }
}

class PPerSpec {
  final String specialisatie;
  final int percentage;

  PPerSpec(this.specialisatie, this.percentage);
}