import 'package:flutter/foundation.dart';
import '../usecase/no_parameters.dart';
import '../../features/authentication/domain/usecases/auto_login.dart';

class AppInitialisation with ChangeNotifier {
  final AutoLogin autoLogin;
  bool isInitialised = true;

  AppInitialisation({required this.autoLogin}) {
    init();
  }

  void init() async {
    await autoLogin(NoParameters());
    isInitialised = true;
    // log('Is Init = true');
    notifyListeners();
  }
}
