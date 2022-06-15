class Device {
  String guid = '';
  String statusSensor = '';
  String statusAktuator = '';
  String nameSensor = '';
  String nameAktuator = '';
  String namePower = '';
  Device(
      this.guid,
      this.statusAktuator,
      this.statusSensor,
      this.nameAktuator,
      this.nameSensor,
      this.namePower,
      );

  Device.fromMap(Map<String, dynamic> device) {
    guid = device["guid"];
    statusAktuator = device["statusAktuator"];
    statusSensor = device["statusSensor"];
    nameAktuator = device["nameAktuator"];
    nameSensor = device["nameSensor"];
    namePower = device["namePower"];

  }

  Map<String, dynamic> toMap() => {
    'guid' : guid,
    'statusAktuator' : statusAktuator,
    'statusSensor' : statusSensor,
    'nameAktuator' : nameAktuator,
    'nameSensor' : nameSensor,
    'namePower' : namePower
  };

  String get getGuid => guid;
  String get getStatusAktuator => statusAktuator;
  String get getStatusSensor => statusSensor;
  String get getNameAktuator => nameAktuator;
  String get getNameSensor => nameSensor;
  String get getNamePower => namePower;

  set getGuid(String value) {
    guid = value;
  }

  set getStatusAktuator(String value) {
    statusAktuator = value;
  }

  set getStatusSensor(String value) {
    statusSensor = value;
  }

  set getNameAktuator(String value) {
    nameAktuator = value;
  }

  set getNameSensor(String value) {
    nameSensor = value;
  }

  set getNamePower(String value) {
    namePower = value;
  }


}
