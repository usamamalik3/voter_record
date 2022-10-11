
import 'package:flutter/material.dart';
import 'package:voterrecord/screens/Dashboard.dart';
import 'package:voterrecord/screens/add_data.dart';
import 'package:voterrecord/screens/partyfrom.dart';
import 'package:voterrecord/screens/voterdetail.dart';
import 'package:voterrecord/screens/voterscreen.dart';
import 'package:voterrecord/screens/votersearch.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String partyfrom = '/partyform';
  static const String voter = '/voter';
  static const String voterrecord = '/voterrecord';
  static const String votersearch = '/votersearch';
  static const String voterdetail = '/voterdetail';

  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case dashboard:
        return MaterialPageRoute<DashBoard>(builder: (context) => const DashBoard());
      case partyfrom:
        return MaterialPageRoute<PartyForm>(builder: (context) => const PartyForm()); 
      case voter:
        return MaterialPageRoute<VoterScreen>(builder: (context) => const VoterScreen()); 
      case voterrecord:
        return MaterialPageRoute<AddVoterData>(builder: (context) => const AddVoterData());  
      case votersearch:
        return MaterialPageRoute<VoterSearch>(builder: (context) => const VoterSearch());
      // case voterdetail:
        // return MaterialPageRoute<Voterdetail>(builder: (context) =>  Voterdetail(voter: voters[index],));  
        

      default:
        return MaterialPageRoute<DashBoard>(builder: (context) => const DashBoard());
    }
  }
}
