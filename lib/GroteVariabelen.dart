part of 'main.dart';

int currentQ = 0;
List<int> antwoordenL = [];
String naam;
List<int> specWaardes = [0, 0, 0, 0];
String specialisatie = "Onbekend";
// ignore: non_constant_identifier_names
int data_version_id = 0;
List<int> dataIds = [];

List<int> specMax = [372,380,372,380];

final List<String> qList = [
    "Je vindt wetten en regels interessant.",
    "Je vindt het belangrijk dat programma's makkelijk en gebruiker vriendelijk zijn.",
    "Je wilt leren hoe bestaande processen kan automatiseren.",
    "Je wilt weten hoe je Big data kan visualiseren en makkelijk bruikbaar kan maken.",
    "Je wilt weten hoe je met behulp van je computer bewijs kan vinden tegen criminelen.",
    "Je wilt weten hoe je webpagina's zo gebruik vriendelijk kan laten werken.",
    "Je bent geïnteresseerd in het werken met algoritmes.",
    "Je vindt het interessant om AI te gebruiken om slimmere programma's te maken.",
    "Je wilt leren hoe je verslagen kan schrijven die makkelijk te begrijpen zijn voor andere mensen.",
    "Je wilt weten welke sensoren het handigste zijn om bepaalde data te vergaren",
    "Je wilt weten hoe je stap voor stap met een team je software zo goed mogelijk kan ontwerpen.",
    "Je vindt het interessant om de beste mogelijk manier te vinden om data makkelijk begrijpelijk te maken voor mensen.",
    "Je vindt de technologieën die jouw beschermen tegen hackers interessant.",
    "Je vind het intressant om te leren hoe je interactie met hardware kan maken.",
    "Je wilt weten hoe je bestaande code kan hergebruiken in jouw programma's.",
    "Je vindt het belangrijk dat bedrijven zo efficiënt mogelijk werken.",
    "Je wilt met behulp van computers criminelen opsporen.",
    "Je wilt weten hoe je applicaties kan maken voor Android en Ios.",
    "Je bent goed in het in zien van patronen.",
    "Je bent goed in conclusies maken.",
];
final List<String> aList = [
    "Helemaal Eens",
    "Eens",
    "Neutraal",
    "Oneens",
    "Helemaal Oneens",
];
final List<List<int>> pList = [
    [10,0,0,0],
    [0,10,0,0],
    [0,2,10,8],
    [2,0,0,10],
    [10,8,6,8],
    [8,10,4,0],
    [5,5,10,7],
    [5,0,7,10],
    [10,3,5,5],
    [0,10,0,7],
    [0,7,9,0],
    [0,0,0,10],
    [10,0,6,0],
    [5,10,8,0],
    [0,8,10,0],
    [0,4,1,10],
    [10,0,0,0],
    [0,10,10,0],
    [10,3,7,10],
    [8,5,0,10]
];

final String opnieuwbeginnen = "Wil je verder gaan waar je gebleven was?";