

import 'package:flutter/material.dart';
import 'package:voterrecord/screens/About/aboutscreen.dart';
import 'package:voterrecord/screens/Contactus/add_office.dart';
import 'package:voterrecord/screens/TanzeemSazi/15rukniBody/bodyscreen.dart';
import 'package:voterrecord/screens/Contactus/complaint.dart';
import 'package:voterrecord/screens/dashboard.dart';
import 'package:voterrecord/screens/TanzeemSazi/meetingscreen.dart';
import 'package:voterrecord/screens/TanzeemSazi/tanzeem_sazi.dart';
import 'package:voterrecord/screens/Voter/add_data.dart';
import 'package:voterrecord/screens/Contactus/contactus.dart';
import 'package:voterrecord/screens/Departments/department_screen.dart';
import 'package:voterrecord/screens/Election/election_mnge_screen.dart';
import 'package:voterrecord/screens/Voter/executive_check.dart';
import 'package:voterrecord/screens/Contactus/office_detail.dart';
import 'package:voterrecord/screens/PartyForm/partyfrom.dart';

import 'package:voterrecord/screens/Voter/voterscreen.dart';
import 'package:voterrecord/screens/Voter/votersearch.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String about = '/about';
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
  static const String addoffice = '/addoffice';
  static const String tanzeemsazi = '/tanzeemsazi';
  static const String complaint = '/complaint';
  static const String meeting = '/meeting';
  static const String bodyscreen = '/bodyscreen';


  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case dashboard:
        return MaterialPageRoute<DashBoard>(builder: (context) => const DashBoard());
      case about:
        return MaterialPageRoute<About>(builder: (context) => const About());
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
      case addoffice:
        return MaterialPageRoute<AddOffice>(builder: (context) => const AddOffice());
      case officedetail:
        return MaterialPageRoute<OfficeDetails>(builder: (context) => const OfficeDetails());
      case complaint:
         return MaterialPageRoute<Complaint>(builder: ((context) =>  const Complaint()));
      
      case meeting:
         return MaterialPageRoute<MeetingScreen>(builder: ((context) =>  const MeetingScreen()));
      case bodyscreen:
         return MaterialPageRoute<BodyScreen>(builder: ((context) => const BodyScreen()));
      
      // case voterdetail:
        // return MaterialPageRoute<Voterdetail>(builder: (context) =>  Voterdetail(voter: voters[index],));  
        

      default:
        return MaterialPageRoute<DashBoard>(builder: (context) => const DashBoard());
    }
  }
}
