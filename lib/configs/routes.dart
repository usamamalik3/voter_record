
import 'package:flutter/material.dart';
import 'package:voterrecord/screens/dashboard.dart';
import 'package:voterrecord/screens/tanzeem_sazi.dart';
import 'package:voterrecord/screens/add_data.dart';
import 'package:voterrecord/screens/contactus.dart';
import 'package:voterrecord/screens/department_screen.dart';
import 'package:voterrecord/screens/election_mnge_screen.dart';
import 'package:voterrecord/screens/executive_check.dart';
import 'package:voterrecord/screens/office_detail.dart';
import 'package:voterrecord/screens/partyfrom.dart';

import 'package:voterrecord/screens/voterscreen.dart';
import 'package:voterrecord/screens/votersearch.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String partyfrom = '/partyform';
  static const String voter = '/voter';
  static const String voterrecord = '/voterrecord';
  static const String executivecheck= '/executivecheck';
  static const String votersearch = '/votersearch';
  static const String voterdetail = '/voterdetail';
  static const String departmentscreen= '/departmentscreen';
  static const String electionscreen = '/electionscreen';
  static const String contactus = '/contactus';
  static const String officedetail = '/officedetail';
  static const String tanzeemsazi = '/tanzeemsazi';


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
      case executivecheck:
        return MaterialPageRoute<ExecutiveScreen>(builder: (context) => const ExecutiveScreen());  
      case votersearch:
        return MaterialPageRoute<VoterSearch>(builder: (context) => const VoterSearch());
      case departmentscreen:
        return MaterialPageRoute<Department>(builder: (context) => const Department());
      case electionscreen:
        return MaterialPageRoute<Election>(builder: (context) => const Election());
      case contactus:
        return MaterialPageRoute<ContactUs>(builder: (context) => const ContactUs());
      case tanzeemsazi:
        return MaterialPageRoute<TanzeemSazi>(builder: (context) => const TanzeemSazi());
      case officedetail:
        return MaterialPageRoute<OfficeDetails>(builder: (context) => const OfficeDetails());
      // case voterdetail:
        // return MaterialPageRoute<Voterdetail>(builder: (context) =>  Voterdetail(voter: voters[index],));  
        

      default:
        return MaterialPageRoute<DashBoard>(builder: (context) => const DashBoard());
    }
  }
}
