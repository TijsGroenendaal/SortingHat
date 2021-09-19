import 'dart:math';

class LocalUser {
  static String name;
  static int currentQuestion = 0;
  static List<int> answersPointList = [];
  static Map<String, int> specialisationPoints = {
    'FICT' : 0,
    'SE': 0,
    'BDAM': 0,
    'IAT': 0,
  };
  static String specialisation = "Unknown";

  static void setSpecialisation() {
    List<int> pointList = [
      LocalUser.specialisationPoints['FICT'],
      LocalUser.specialisationPoints['IAT'],
      LocalUser.specialisationPoints['SE'],
      LocalUser.specialisationPoints['BDAM'],
    ];
    int highest = pointList.reduce(max);
    if (highest != 0) {
      int index = pointList.indexOf(highest);
      if (index == 0) {
        LocalUser.specialisation = "Forensic ICT";
      } else if (index == 1) {
        LocalUser.specialisation = "Interaction Technologies";
      } else if (index == 2) {
        LocalUser.specialisation = "Software Engineering";
      } else if (index == 3) {
        LocalUser.specialisation = "Business Data Management";
      }
    }
  }

  static void resetUser() {
    LocalUser.specialisation = "Unknown";
    LocalUser.currentQuestion = 0;
    LocalUser.answersPointList.clear();
    LocalUser.specialisationPoints = {
      'FICT' : 0,
      'SE': 0,
      'BDAM': 0,
      'IAT': 0,
    };
    LocalUser.name = null;
  }
}

class ResultUser {
  String name;
  Map<String, dynamic> specialisationPoints = {
    'FICT' : 0,
    'SE': 0,
    'BDAM': 0,
    'IAT': 0,
  };
  String specialisation = 'Unknown';

  ResultUser({this.name, this.specialisation, this.specialisationPoints});
}
