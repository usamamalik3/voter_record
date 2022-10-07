import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:voterrecord/screens/Dashboard.dart';
import 'package:voterrecord/screens/add_data.dart';
import 'package:voterrecord/screens/partyfrom.dart';
import 'package:voterrecord/screens/temp.dart';
import 'package:voterrecord/screens/votersearch.dart';

class Routes{

  static final routes = [
    GetPage(name: '/', page: () => Temp()),
    GetPage(name: '/register', page: () => const PartyForm()),
    GetPage(name: '/votersearch', page: () => const VoterSearch()),
    GetPage(name: '/voterlist', page: () => const AddData()),
  ];
}