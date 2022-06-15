import 'package:dart_amqp/dart_amqp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeauto/common/snackbar_service.dart';
import 'package:homeauto/constants/color.dart';
import 'package:homeauto/constants/const.dart';
import 'package:homeauto/constants/route_name.dart';
import 'package:homeauto/locator.dart';
import 'package:homeauto/services/alert_service.dart';
import 'package:homeauto/services/navgation_service.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/services/storage_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  TextEditingController vhostController = TextEditingController();
  TextEditingController queuesSensorController = TextEditingController();
  TextEditingController queuesActuatorController = TextEditingController();
  TextEditingController queuesPowerController = TextEditingController();

  final RmqService _rmqService = locator<RmqService>();
  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  String user = '';
  String pass = '';
  String host = '';
  String vHost = '';
  String queuesSensor = '';
  String queuesActuator = '';
  String queuesPower = '';
  bool StatusRmqLogin = false;
  bool _obscureText = true;
  late Client client;

  void loginAccount(BuildContext context) async {
    user = userController.text;
    pass = passController.text;
    host = hostController.text;
    vHost = vhostController.text;
    queuesSensor = queuesSensorController.text;
    queuesPower = queuesPowerController.text;
    if (user.isEmpty &&
        pass.isEmpty &&
        host.isEmpty &&
        vHost.isEmpty &&
        queuesPower.isEmpty &&
        queuesSensor.isEmpty) {
      _snackbarService.showSnakbar(
          context, 'Please fill all field', ErrorColor);
    } else {
      await _storageService.setString(localDataUser, user);
      await _storageService.setString(localDataHost, host);
      await _storageService.setString(localDataVHost, vHost);
      await _storageService.setString(localDataPass, pass);
      await _storageService.setString(localDataQPower, queuesPower);
      await _storageService.setString(localDataQSensor, queuesSensor);
      print('[Login user] $user');
      print('[Login host} $host');
      print('[Login vHost] $vHost');
      print('[Login pass] $pass');
      print('[Login Sensor] $queuesSensor');
      print('[Login Power] $queuesPower');

      _alertService.showSuccess(context, "Success", "Credential Data Saved",
              () {
            _navigationService.replaceTo(dashboardViewRoute);
          });
    }
  }

  void RmqLogin(BuildContext context) async {
    try {
      ConnectionSettings settings = ConnectionSettings(
        host: 'rmq2.pptik.id',
        authProvider: PlainAuthenticator(user, pass),
        virtualHost: vHost,
      );
      client = Client(settings: settings);
      client.connect().then((value) {
        StatusRmqLogin = true;
      });
      CheckRmqLogin(context);
    } catch (e) {
      print("Kesalahan Error $e");
    }
  }

  void CheckRmqLogin(BuildContext context) async {
    if(StatusRmqLogin){
      goto_dashboard(context);
      _snackbarService.showSnakbar(context, "Succes,Credential Data Saved", SuccesColor);
    }else{
      print('[Login user] $user');
      print('[Login host} $host');
      print('[Login vHost] $vHost');
      print('[Login pass] $pass');
      print('[Login Sensor] $queuesSensor');
      print('[Login Actuator] $queuesActuator');
      print('[Login Power] $queuesPower');
      _snackbarService.showSnakbar(context, "Failed,Your Credential Not Correct", ErrorColor);
    }
  }

  void goto_dashboard(BuildContext context) async {
    await _storageService.setString(islogin, 'true');
    await _storageService.setString(localDataUser, user);
    await _storageService.setString(localDataHost, host);
    await _storageService.setString(localDataVHost, vHost);
    await _storageService.setString(localDataPass, pass);
    await _storageService.setString(localDataQSensor, queuesSensor);
    await _storageService.setString(localDataQPower, queuesPower);
    await _storageService.setString(localDataStatusLampu, 'OFF');
    await _storageService.setString(localDataStatusSteker, 'OFF');
    print('[Login user] $user');
    print('[Login host} $host');
    print('[Login vHost] $vHost');
    print('[Login pass] $pass');
    print('[Login Sensor] $queuesSensor');
    print('[Login Power] $queuesPower');
    //_navigationService.navigateTo(dashboardViewRoute);
  }
}
