# SorteerHoed Informatica Leiden

Mobiele applicatie gemaakt met Flutter.

In het eerste jaar van mijn studie  kregen we de opdracht om een programma te schrijven die op basis van een aantal vragen je indeelt in een specialisatie. De applicatie moest geschreven worden in python en verder was je vrij om te kiezen hoe je het ging maken. Mijn groep had besloten om de app grafisch te maken i.p.v. via de console.
Het was natuurlijk het eerste project dus zag de code en de GUI er niet heel mooi uit. 
<br><br>
In de eerste periode van jaar 2 krijg ik een vak Frameworks waarbij je zelf mag beslissen welke framework je graag wilt leren.
Ik heb als Framework Flutter gekozen, ik zou daarmee graag het project uit het vorige jaar mooier en beter willen coderen voor op een mobiele telefoon.
<p align="center">
	<img src="images/ReadMeImages/SortingHat_Home.jpg" alt="Screenshot HomeScreen" height="700" style="margin-right: 10vw"/><img src="images/ReadMeImages/SortingHat_Question.jpg" alt="Screenshot QuestionScreen" height="700"/>
</p>
Na het opstarten van de app wordt er gevraagd om te registreren of in te loggen. Voor deze service gebruik ik de Firebase Authenticatie.
<br><br>
De vragenlijst bestaat uit 20 vragen over de vier verschillende specialisaties.
Aan het einde van de test wordt er gevraagt of je je resulaat online wilt delen.
Hierna wordt er een grafiek getoont met percentages per specialisatie.
<br><br>
Dankzij de Firebase authenticatie kunnen gebruikers hun gedeelde data weer verwijderen.
<br><br>
De antwoorden worden opgeslagen in een lokale SQFLite database of in een Firebase FireStore database, en kunnen hierdoor later opnieuw worden ingeladen in het resultaat scherm.
<p align="center">
	<img src="images/ReadMeImages/SortingHat_Result.jpg" alt="Screenshot ResultScreen" height="700px" style="margin-right: 10vw"/><img src="images/ReadMeImages/SortingHat_OnlineDB.jpg" alt="Screenshot OnlineDB" height="700px"/>
</p>

**Dependencies**
|NMR|Naam|Versie|Beschrijving|
|:--|:--|:--|:--|
|1. |sqflite:||Lokale database|
|2. |rflutter_alert|^2.0.4 |Meldingen op scherm|
|3. |charts_flutter|^0.11.0|Grafiek op resultaat scherm|
|4. |path_provider|^2.0.3|Vinden van database locatie|
|5. |cupertino_icons|^1.0.0|Icoonen|
|6. |firebase_core|^1.6.0|Verbinding naar Firebase|
|7. |cloud_firestore|^2.5.2|Firestore database|
|8. |firebase_auth|^3.1.1|User authenticatie|
|9. |modal_progress_hud|^0.1.3|Laad widget tijdens authenticatie|
|10.|animated_text_kit|^4.2.1|Text animaties|
