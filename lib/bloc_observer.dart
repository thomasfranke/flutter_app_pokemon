import 'exports.dart';

class AppObserver extends BlocObserver {
  const AppObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }
}
