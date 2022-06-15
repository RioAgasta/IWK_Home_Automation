import 'dart:async';

import 'package:homeauto/constants/const.dart';
import 'package:homeauto/constants/route_name.dart';
import 'package:homeauto/locator.dart';
import 'package:homeauto/services/navgation_service.dart';
import 'package:homeauto/services/storage_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();

  startTimer() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, handleStartUpLogic);
  }

  Future handleStartUpLogic() async {
    //_navigationService.replaceTo(dashboardViewRoute);
    final isLogin = await _storageService.getString(localDataUser);
    print(isLogin);
    if (isLogin == null) {
      _navigationService.replaceTo(loginViewRoute);
    } else {
      _navigationService.replaceTo(dashboardViewRoute);
    }
  }
}
