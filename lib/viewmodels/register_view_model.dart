import 'package:flutter/cupertino.dart';
import 'package:homeauto/constants/const.dart';
import 'package:homeauto/constants/route_name.dart';
import 'package:homeauto/locator.dart';
import 'package:homeauto/models/model_data_device.dart';
import 'package:homeauto/services/alert_service.dart';
import 'package:homeauto/services/navgation_service.dart';



import 'package:homeauto/services/storage_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class RegisterViewModel extends BaseModel {
  TextEditingController guidController = TextEditingController();
  TextEditingController nameSensorController = TextEditingController();
  TextEditingController nameAktuatorController = TextEditingController();
  TextEditingController namePowerController = TextEditingController();

  //final LocalDatabase _localDatabase = locator<LocalDatabase>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();
  final StorageService _storageService = locator<StorageService>();

  // late List<Device> devices;
  // Device? device;

  Future<void> getTask() async {
    showData();
    //devices = await _localDatabase.getAllDevice();
  }

  void showData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString('datadevice');

    var result = convert.jsonDecode(data!);

    var guid = result['guid'];
    guidController.text = guid;
    namePowerController.text = (await _storageService.getString(localDataNamePower))!;
    nameSensorController.text = (await _storageService.getString(localDataNameLampu))!;
    nameAktuatorController.text = (await _storageService.getString(localDataNameSteker))!;
  }

  void registerDevice(BuildContext context) async {
    if(guidController.text.isNotEmpty &&
        nameAktuatorController.text.isNotEmpty &&
        nameSensorController.text.isNotEmpty &&
        namePowerController.text.isNotEmpty){

      String guid = guidController.text;
      String nameSensor = nameSensorController.text;
      String nameAktuator = nameAktuatorController.text;
      String namePower = namePowerController.text;

      await _storageService.setString(localDataGuid, guid);
      await _storageService.setString(localDataNameLampu, nameSensor);
      await _storageService.setString(localDataNameSteker, nameAktuator);
      await _storageService.setString(localDataNamePower, namePower);
      await _storageService.setString(localDataStatusLampu, 'ON');
      await _storageService.setString(localDataStatusSteker, 'ON');

      _alertService.showWarning(
          'Success',
          'Device Added',
          (){movePage(dashboardViewRoute);}
      );
      //_navigationService.navigateTo(dashboardViewRoute);
    } else {
      print('print update');
      _alertService.showWarning(
          'Warning',
          'Please Fill All Field',
          _navigationService.pop
      );
    }
    // try {
    //   if (guidController.text.isNotEmpty){
    //     var guid = guidController.text;
    //     var statusAktuator = 'OFF';
    //     var statusSensor = 'OFF';
    //     var nameAktuator = nameAktuatorController.text;
    //     var nameSensor = nameSensorController.text;
    //     var namePower = namePowerController.text;
    //
    //     device = Device(guid, statusAktuator, statusSensor, nameAktuator, nameSensor, namePower);
    //     print('[GUID From QR] $guid');
    //
    //     await _localDatabase.addDevice(device!);
    //     print('[Added to SQLITE] $device');
    //     print('[Added to SQLITE] Success');
    //
    //
    //     _alertService.showSuccess(
    //         context,
    //         'Success',
    //         'added Successfully',
    //         (){_navigationService.replaceTo(dashboardViewRoute);
    //         });
    //   } else {
    //     _alertService.showWarning("Warning", "Please fill all field",
    //             () {
    //           _navigationService.pop();
    //         });
    //   }
    // } catch (e){
    //   _alertService.showError(context, "Error", "Something Wrong",
    //           () {
    //         _navigationService.navigateTo(dashboardViewRoute);
    //       });
    // }
  }

  void checkDataQr(BuildContext context) async {
    //final guid = await _storageService.getString(localDataGuid);
    // if(guid == null){
      _navigationService.navigateTo(qrViewRoute);
    // } else {
    //   _alertService.showWarning(
    //       'Warning',
    //       'You Already Registered Device',
    //           (){_navigationService.pop();
    //       });
    // }
  }

  void movePage(String routeName) {
    _navigationService.replaceTo(routeName);
  }
}

