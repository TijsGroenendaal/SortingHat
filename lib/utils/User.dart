import 'dart:math';

class User {
  static String name;
  static int currentQuestion = 0;
  static List<int> answersPointList = [];
  static List<int> specialisationPoints = [0, 0, 0, 0];
  static String specialisation = "Unknown";
  static List<int> dataIds = [];

  static void setSpecialisation() {
    int highest = User.specialisationPoints.reduce(max);

    if (highest != 0) {
      int index = User.specialisationPoints.indexOf(highest);
      if (index == 0) {
        User.specialisation = "Forensic ICT";
      } else if (index == 1) {
        User.specialisation = "Interaction Technologies";
      } else if (index == 2) {
        User.specialisation = "Software Engineering";
      } else if (index == 3) {
        User.specialisation = "Business Data Management";
      }
    }
  }
}
