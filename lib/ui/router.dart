import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeauto/constants/route_name.dart';
import 'package:homeauto/ui/views/dashboard_view.dart';
import 'package:homeauto/ui/views/login_view.dart';
import 'package:homeauto/ui/views/qr_view.dart';
import 'package:homeauto/ui/views/register_view.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name) {
    case dashboardViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: DashboardView()
      );
    case loginViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: LoginView()
      );
    case registerViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: RegisterView()
      );
    case qrViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: QRViewExample()
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _pageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      builder: (_) => viewToShow,
      settings: RouteSettings(
          name: routeName
      )
  );
}