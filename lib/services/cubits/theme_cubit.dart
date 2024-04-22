import '/exports.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);
  void toggleTheme() {
    state == true ? emit(false) : emit(true);
  }
}
