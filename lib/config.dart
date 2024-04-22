import 'package:intl/intl.dart';

class Config {
  // Date Format:
  static DateFormat formatDateDMY = DateFormat('dd/MM/yyyy');
  static DateFormat formatDateMDY = DateFormat('MM/dd/yyyy');
  static DateFormat formatDate = DateFormat('yyyy-MM-dd');
  static DateFormat formatTime12 = DateFormat('hh:mm a');
  static DateFormat formatTime24 = DateFormat('HH:mm');

  // Styles:
  static bool darkMode = true;
}
