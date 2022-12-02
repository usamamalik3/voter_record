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
      appBar: AppBar(),
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