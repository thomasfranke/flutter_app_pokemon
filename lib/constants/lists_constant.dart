class ConstantsLists {
  static const List<String> shiftIntervals = ['15', '20', '30', '45', '60', '90', '120'];

  static List<String> shifts = generateShiftList();

  static List<String> generateShiftList() {
    List<String> listShift = [];
    for (int hour = 0; hour < 24; hour++) {
      for (int minute = 0; minute < 60; minute += 30) {
        String hourString = hour.toString().padLeft(2, '0');
        String minuteString = minute.toString().padLeft(2, '0');
        listShift.add('$hourString:$minuteString:00');
      }
    }
    return listShift;
  }
}
