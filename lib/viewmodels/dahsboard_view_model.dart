import 'package:flutter/material.dart';
import 'package:homeauto/constants/const.dart';
import 'package:homeauto/constants/route_name.dart';
import 'package:homeauto/locator.dart';
import 'package:homeauto/models/model_data_device.dart';
import 'package:homeauto/services/alert_service.dart';
import 'package:homeauto/services/navgation_service.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/services/storage_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';

class DashboardViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();
  final RmqService _rmqService = locator<RmqService>();
  final StorageService _storageService = locator<StorageService>();

  TextEditingController guidController = TextEditingController();
  TextEditingController nameSensorController = TextEditingController();
  TextEditingController nameAktuatorController = TextEditingController();
  TextEditingController namePowerController = TextEditingController();
  TextEditingController guidPowerController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController powerController = TextEditingController();
  TextEditingController energyController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController pfController = TextEditingController();

  bool index1 = false;
  bool index2 = false;

  String values = '11';
  String lampu = '';
  String steker = '';
  String power = '';
  void initState() async {
    print('[Values Lampu] ${values}');
    print('[Values Steker] ${values}');
    await showData();
    setBusy(true);
    checkStatusLamp();
    checkStatusSteker();
    subcribeDataPower();
    setBusy(false);
  }

  Future<void>showData() async{
    final namePower = await _storageService.getString(localDataNamePower);
    final nameLamp = await _storageService.getString(localDataNameLampu);
    final nameSteker = await _storageService.getString(localDataNameSteker);

    nameSensorController.text = nameLamp!;
    nameAktuatorController.text = nameSteker!;
    namePowerController.text = namePower!;


  }
  void checkStatusLamp() async {
    final status = await _storageService.getString(localDataStatusLampu);
    if (status == 'OFF') {
      index1 = true;
      print('[Status Awal Lampu} $status');
    } else {
      index1 = false;
      print('[Status Awal Lampu} $status');
    }
  }

  void checkStatusSteker() async {
    final status = await _storageService.getString(localDataStatusSteker);
    if (status == 'OFF') {
      index2 = true;
      print('[Status Awal Steker} $status');
    } else {
      index2 = false;
      print('[Status Awal Steker} $status');
    }
  }

  void checkDataQr(BuildContext context) async {
    final guid = await _storageService.getString(localDataGuid);
    if(guid == null){
      _navigationService.navigateTo(qrViewRoute);
    } else {
      _alertService.showWarning(
          'Warning',
          'You Already Registered Device',
              (){_navigationService.pop();
          });
    }
  }

  void replaceCharAt(int index,String newChar){
    values =values.substring(0, index) + newChar + values.substring(index + 1);
    print('[Replace Character] $values');
  }

  void onLamp(bool status) async {
    final host = await _storageService.getString(localDataHost);
    final user = await _storageService.getString(localDataUser);
    final pass = await _storageService.getString(localDataPass);
    final vHost = await _storageService.getString(localDataVHost);
    final queues = await _storageService.getString(localDataQSensor);
    final guid = await _storageService.getString(localDataGuid);
    if (status) {
      _rmqService.publish(
          '$guid#$values',
          host!.toString(),
          user!.toString(),
          pass!.toString(),
          vHost!.toString(),
          queues!.toString()
      );
      await _storageService.setString(localDataStatusLampu, 'OFF');
      print('[Values Lampu ON] ${values}');
    } else {
      _rmqService.publish(
          '$guid#$values',
          host!.toString(),
          user!.toString(),
          pass!.toString(),
          vHost!.toString(),
          queues!.toString()
      );
      await _storageService.setString(localDataStatusLampu, 'ON');
      print('[Values Lampu OFF] ${values}');
    }
    print('[Guid Sensor] ${guid}');
    index1 = status;
  }

  void onSteker(bool status) async {
    final host = await _storageService.getString(localDataHost);
    final user = await _storageService.getString(localDataUser);
    final pass = await _storageService.getString(localDataPass);
    final vHost = await _storageService.getString(localDataVHost);
    final queues = await _storageService.getString(localDataQSensor);
    final guid = await _storageService.getString(localDataGuid);
    if (status) {
      // if (index1 == false){
      //   _rmqService.publish(
      //       '$guid#00',
      //       host!.toString(),
      //       user!.toString(),
      //       pass!.toString(),
      //       vHost!.toString(),
      //       queues!.toString()
      //   );
      // }
      _rmqService.publish(
          '$guid#$values',
          host!.toString(),
          user!.toString(),
          pass!.toString(),
          vHost!.toString(),
          queues!.toString()
      );
      await _storageService.setString(localDataStatusSteker, 'OFF');
      print('[Values Steker ON] ${values}');
    } else {

      _rmqService.publish(
          '$guid#$values',
          host!.toString(),
          user!.toString(),
          pass!.toString(),
          vHost!.toString(),
          queues!.toString()
      );
      await _storageService.setString(localDataStatusSteker, 'ON');
      print('[Values Steker OFF] ${values}');
    }
    print('[Guid Steker] ${guid}');
    index2 = status;
  }

  void subcribeDataPower() async{
    setBusy(true);
    final host = await _storageService.getString(localDataHost);
    final user = await _storageService.getString(localDataUser);
    final pass = await _storageService.getString(localDataPass);
    final vHost = await _storageService.getString(localDataVHost);
    _rmqService.subscribe(
        sensor,
        host!.toString(),
        user!.toString(),
        pass!.toString(),
        vHost!.toString(),
    );
    setBusy(false);
  }

  void sensor() async {
    setBusy(true);
    final queues = await _storageService.getString(localDataQPower);
    _rmqService.dataDevice(
        queues.toString(),
        setValueSensor
    );
    setBusy(false);
    print('[Data Power] $queues');
  }

  void setValueSensor(String message){
    List<String> list = message.split("#");
    setBusy(true);
    guidPowerController.text = list[0];
    voltageController.text = list[1];
    currentController.text = list[2];
    powerController.text = list[3];
    energyController.text = list[4];
    frequencyController.text = list[5];
    pfController.text = list[6];
    setBusy(false);
  }

  void movePage(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void resetData() async {
    _alertService.alertDialog("Warning", "Delete Data ?", () {_navigationService.pop();}, () async { await _storageService.clearStorage();
    _navigationService.navigateTo(loginViewRoute);
    print('[Delete Device] Success');});
    print('[Alert Delete]');
    // await _storageService.clearStorage();
    // _navigationService.navigateTo(loginViewRoute);
    // print('[Delete Device] Success');
  }

}