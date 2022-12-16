

import 'package:flutter/material.dart';
import 'package:voterrecord/screens/about/about.dart';
import 'package:voterrecord/screens/about/about_tlp.dart';
import 'package:voterrecord/screens/contactus/add_office.dart';
import 'package:voterrecord/screens/documents/documnets.dart';
import 'package:voterrecord/screens/documents/halqabandia.dart';
import 'package:voterrecord/screens/education/Education.dart';
import 'package:voterrecord/screens/partyForm/search.dart';
import 'package:voterrecord/screens/tanzeemSazi/15rukniBody/bodyscreen.dart';
import 'package:voterrecord/screens/contactus/complaint.dart';
import 'package:voterrecord/screens/tanzeemSazi/15rukniBody/divsionbody.dart';
import 'package:voterrecord/screens/tanzeemSazi/15rukniBody/tanzeembody.dart';
import 'package:voterrecord/screens/tanzeemSazi/15rukniBody/zonebody.dart';
import 'package:voterrecord/screens/dashboard.dart';
import 'package:voterrecord/screens/tanzeemSazi/meetingscreen.dart';
import 'package:voterrecord/screens/tanzeemSazi/tanzeem_sazi.dart';
import 'package:voterrecord/screens/voter/add_data.dart';
import 'package:voterrecord/screens/contactus/contactus.dart';
import 'package:voterrecord/screens/departments/department_screen.dart';
import 'package:voterrecord/screens/election/election_mnge_screen.dart';
import 'package:voterrecord/screens/voter/executive_check.dart';
import 'package:voterrecord/screens/contactus/office_detail.dart';
import 'package:voterrecord/screens/partyForm/partyfrom.dart';

import 'package:voterrecord/screens/voter/voterscreen.dart';
import 'package:voterrecord/screens/voter/votersearch.dart';
import 'package:voterrecord/screens/signin.dart';

class Routes {
  static const String signin = '/sigin';
  static const String dashboard = '/dashboard';
  static const String aboutScreen = '/aboutScreen';
  static const String aboutTlp = '/aboutTlp';
  static const String partyfrom = '/partyform';
  static const String voter = '/voter';
  static const String voterrecord = '/voterrecord';
  static const String executivecheck = '/executivecheck';
  static const String votersearch = '/votersearch';
  static const String voterdetail = '/voterdetail';
  static const String departmentscreen = '/departmentscreen';
  static const String electionscreen = '/electionscreen';
  static const String contactus = '/contactus';
  static const String officedetail = '/officedetail';
  static const String addoffice = '/addoffice';
  static const String tanzeemsazi = '/tanzeemsazi';
  static const String complaint = '/complaint';
  static const String meeting = '/meeting';
  static const String bodyscreen = '/bodyscreen';
  static const String zonebody = '/zonebody';
  static const String divsionbody = '/divsionbody';
  static const String tanzeembody = '/tanzeembody';
  static const String document = '/document';
  static const String halqabandia = '/halqabandia';
  static const String education = '/education';
  static const String membersearch = '/membersearch';

  

  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case signin:
        return MaterialPageRoute<SignInScreen>(
            builder: (context) => const SignInScreen());
      case dashboard:
        return MaterialPageRoute<DashBoard>(
            builder: (context) => const DashBoard());
      case aboutScreen:
        return MaterialPageRoute<AboutScreen>(builder: (context) => const AboutScreen());

      case aboutTlp:
        return MaterialPageRoute<AboutTlp>(builder: (context) => const AboutTlp() );
      case partyfrom:
        return MaterialPageRoute<PartyForm>(
            builder: (context) => const PartyForm());
      case voter:
        return MaterialPageRoute<VoterScreen>(
            builder: (context) => const VoterScreen());
      case voterrecord:
        return MaterialPageRoute<AddVoterData>(
            builder: (context) => const AddVoterData());
      case executivecheck:
        return MaterialPageRoute<ExecutiveScreen>(
            builder: (context) => const ExecutiveScreen());
      case votersearch:
        return MaterialPageRoute<VoterSearch>(
            builder: (context) => const VoterSearch());

      case departmentscreen:
        return MaterialPageRoute<Department>(
            builder: (context) => const Department());
      case electionscreen:
        return MaterialPageRoute<Election>(
            builder: (context) => const Election());
      case contactus:
        return MaterialPageRoute<ContactUs>(
            builder: (context) => const ContactUs());
      case tanzeemsazi:
        return MaterialPageRoute<TanzeemSazi>(
            builder: (context) => const TanzeemSazi());
      case addoffice:
        return MaterialPageRoute<AddOffice>(
            builder: (context) => const AddOffice());
      case officedetail:
        return MaterialPageRoute<OfficeDetails>(
            builder: (context) => const OfficeDetails());
      case complaint:
        return MaterialPageRoute<Complaint>(
            builder: ((context) => const Complaint()));

      case meeting:
        return MaterialPageRoute<MeetingScreen>(
            builder: ((context) => const MeetingScreen()));
      case bodyscreen:
        return MaterialPageRoute<BodyScreen>(
            builder: ((context) => const BodyScreen()));

      case zonebody:
        return MaterialPageRoute<ZoneBody>(
            builder: ((context) => ZoneBody(arg: routeSettings.arguments)));
      case divsionbody:
        return MaterialPageRoute<DivsionBody>(
            builder: ((context) =>
                DivsionBody(arg: routeSettings.arguments as String)));
       case tanzeembody:
        return MaterialPageRoute<TanzeemBody>(
            builder: ((context) =>
                const TanzeemBody()));
       case document:
        return MaterialPageRoute<DocumentScreen>(
            builder: ((context) =>
                const DocumentScreen()));
        case halqabandia:
         return MaterialPageRoute<HalqaBandia>(
            builder: ((context) =>
                const HalqaBandia()));
       case education:
        return MaterialPageRoute<EducationScreen>(
            builder: ((context) =>
                const EducationScreen()));
      case membersearch:
        return MaterialPageRoute<MemberSearch>(
            builder: ((context) =>
                const MemberSearch()));
      // case voterdetail:
      // return MaterialPageRoute<Voterdetail>(builder: (context) =>  Voterdetail(voter: voters[index],));

      default:
        return MaterialPageRoute<DashBoard>(
            builder: (context) => const DashBoard());
    }
  }
}
