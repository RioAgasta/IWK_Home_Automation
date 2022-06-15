import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homeauto/locator.dart';
import 'package:homeauto/services/navgation_service.dart';
import 'package:homeauto/ui/router.dart';
import 'package:homeauto/ui/views/login_view.dart';
import 'package:homeauto/ui/views/dashboard_view.dart';
import 'package:homeauto/ui/views/register_view.dart';
import 'package:homeauto/ui/views/startup_view.dart';

void main() {
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  // Crashlytics.instance.enableInDevMode = true;

  // // Pass all uncaught errors to Crashlytics.
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;
  setupLocator();

  runZoned(
        () {
      runApp(MyApp());
    },
    // onError: Crashlytics.instance.recordError
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
      ),
      title: 'Hioto',
      home: StartUpView(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}