import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:voterrecord/screens/tanzeemSazi/15rukniBody/tabledata.dart';

class TanzeemBody extends StatefulWidget {
  const TanzeemBody({super.key});

  @override
  State<TanzeemBody> createState() => _TanzeemBodyState();
}

class _TanzeemBodyState extends State<TanzeemBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("15رکنی باڈی"),
      ),
      body: Column(
        children: const [
          Expanded(
            flex: 1,
            child: TableData()),
        ],
      ),
    );
  }
}