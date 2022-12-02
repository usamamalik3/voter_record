import 'package:flutter/material.dart';
import 'package:voterrecord/utils/container_menu.dart';

import '../../../utils/list_utils.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Center(child:  Text("زون")),),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerMenuNoIcon(list: zone, crossAxisSpacing: 16, mainAxisSpacing: 16, crossAxisCount: 2, childAspectRatio: 2),
            
          ],
        ),
      ),

    );
  }
}