import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/viewmodels/startup_view_model.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) {
        model.startTimer();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/homeautokit.png',
                  width: 150,
                ),
                verticalSpaceSmall,
                Text('HOME AUTOMATION', style: TextStyle(color: Colors.cyan, fontSize: 25),),
                verticalSpaceSmall,
                CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.cyan,
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.cyan),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
