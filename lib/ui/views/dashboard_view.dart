import 'package:flutter/material.dart';
import 'package:homeauto/constants/route_name.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/ui/views/register_view.dart';
import 'package:homeauto/viewmodels/dahsboard_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        onModelReady: (model) => model.initState(),
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
            backgroundColor: Colors.cyan,
              appBar: AppBar(
                title: const Text("HOME AUTOMATION"),
                centerTitle: true,
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: () {
                        model.checkDataQr(context);
                      },
                      icon: const Icon(Icons.qr_code_scanner,)
                  )
                ],
            ),
              body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Column(
                              children: <Widget>[
                                model.namePowerController.text.isNotEmpty ?
                                Text(
                                  model.namePowerController.text,
                                  style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                                    : const Text(
                                  'Power Meter',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "GUID",
                                        //       style: TextStyle(fontSize: 18),
                                        //     ),
                                        //     Text(
                                        //       model.guidPowerController.text,
                                        //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                                        //       ),
                                        //       maxLines: 1,
                                        //     )
                                        //   ],
                                        // ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Voltage",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  model.voltageController.text,
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                                Text("V",
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Current",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  model.currentController.text,
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                                Text("A",
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Power",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  model.powerController.text,
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                                Text("W",
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Energy",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  model.energyController.text,
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                                Text("kWh",
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Frequency",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  model.frequencyController.text,
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                                Text("Hz",
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.height*.225,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      model.nameSensorController.text.isNotEmpty ?
                                      Text(
                                        model.nameSensorController.text,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                          : const Text(
                                        'Lampu Trainer',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      verticalSpaceMedium,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 10),
                                              child: InkWell(
                                                splashColor: Colors.white,
                                                child: AnimatedContainer(
                                                  duration: const Duration(milliseconds: 200),
                                                  curve: Curves.decelerate,
                                                  width: 70,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                    border: Border.all(
                                                        color: model.index1
                                                            ? Colors.black54
                                                            : Colors.cyan),
                                                    color:
                                                    model.index1 ? Colors.cyan : Colors.white,
                                                  ),
                                                  child: AnimatedAlign(
                                                    duration: const Duration(milliseconds: 300),
                                                    alignment: model.index1
                                                        ? Alignment.centerRight
                                                        : Alignment.centerLeft,
                                                    curve: Curves.decelerate,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color: model.index1
                                                                ? Colors.white
                                                                : Colors.cyan,
                                                            borderRadius:
                                                            BorderRadius.circular(100)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  setState(() {
                                                    //model.replaceCharAt(0, '1');
                                                    //index1 =! index1;
                                                    model.index1 = !model.index1;
                                                    if (model.index1) {
                                                      model.replaceCharAt(0, '0');
                                                      model.onLamp(model.index1);
                                                    } else {
                                                      model.replaceCharAt(0, '1');
                                                      model.onLamp(model.index1);
                                                    }
                                                    // model.button1(index1);
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.wb_incandescent, color: Colors.black, size: 35,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.height*.225,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      model.nameAktuatorController.text.isNotEmpty ?
                                      Text(
                                        model.nameAktuatorController.text,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                          : const Text(
                                        'Steker Trainer',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      verticalSpaceMedium,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 10),
                                              child: InkWell(
                                                splashColor: Colors.white,
                                                child: AnimatedContainer(
                                                  duration: const Duration(milliseconds: 200),
                                                  curve: Curves.decelerate,
                                                  width: 70,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                    border: Border.all(
                                                        color: model.index2
                                                            ? Colors.black54
                                                            : Colors.cyan),
                                                    color:
                                                    model.index2 ? Colors.cyan : Colors.white,
                                                  ),
                                                  child: AnimatedAlign(
                                                    duration: const Duration(milliseconds: 300),
                                                    alignment: model.index2
                                                        ? Alignment.centerRight
                                                        : Alignment.centerLeft,
                                                    curve: Curves.decelerate,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color: model.index2
                                                                ? Colors.white
                                                                : Colors.cyan,
                                                            borderRadius:
                                                            BorderRadius.circular(100)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  setState(() {
                                                    //model.replaceCharAt(0, '1');
                                                    //index1 =! index1;
                                                    model.index2 = !model.index2;
                                                    if (model.index2) {
                                                      model.replaceCharAt(1, '0');
                                                      model.onSteker(model.index2);
                                                    } else {
                                                      model.replaceCharAt(1, '1');
                                                      model.onSteker(model.index2);
                                                    }
                                                    // model.button1(index1);
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.bolt, color: Colors.black, size: 35,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          TextButton(
                            child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Center(child: Text(
                                "RESET",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  color: Colors.red
                                ),
                              )
                              ),
                            ),
                            onPressed: () {
                              model.resetData();
                            },
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  model.movePage(registerViewRoute);
                },
                child: const Icon(Icons.add, color: Colors.black,),
              ),
            )
        )
    );
  }
}
