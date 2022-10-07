import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voterrecord/screens/Dashboard.dart';
import 'package:voterrecord/screens/partyfrom.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String registeration = '/register';

  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case dashboard:
        return MaterialPageRoute<DashBoard>(builder: (context) => DashBoard());
      case registeration:
        return MaterialPageRoute<PartyForm>(builder: (context) => const PartyForm());  
        

      default:
        return MaterialPageRoute<DashBoard>(builder: (context) => DashBoard());
    }
  }
}
