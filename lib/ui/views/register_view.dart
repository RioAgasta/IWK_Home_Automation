import 'package:flutter/material.dart';
import 'package:homeauto/viewmodels/register_view_model.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        onModelReady: (model) => model.getTask(),
        builder: (context, model, child) => SafeArea(
                child: Scaffold(
              backgroundColor: Colors.cyan,
              appBar: AppBar(
                title: Text("Register Device"),
                centerTitle: true,
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: () {
                        model.checkDataQr(context);
                      },
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.black,
                      ))
                ],
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Input Saklar",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Device Name",
                                border: OutlineInputBorder(),
                              ),
                              controller: model.nameSensorController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "GUID",
                                border: OutlineInputBorder(),
                              ),
                              //readOnly: true,
                              controller: model.guidController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Input Steker",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Device Name",
                                border: OutlineInputBorder(),
                              ),
                              controller: model.nameAktuatorController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "GUID",
                                border: OutlineInputBorder(),
                              ),
                              //readOnly: true,
                              controller: model.guidController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Input Power Meter",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Device Name",
                                border: OutlineInputBorder(),
                              ),
                              controller: model.namePowerController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "GUID",
                                border: OutlineInputBorder(),
                              ),
                              //readOnly: true,
                              controller: model.guidController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(
                            "ADD",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                        ),
                        onTap: () {
                          model.registerDevice(context);
                        },
                      ),
                    ],
                  ),
                ),
              )),
            )));
  }
}
