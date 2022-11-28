import 'package:flutter/material.dart';


/// Full screen loading indicator.
class FullScreenIndicator extends StatelessWidget {
  const FullScreenIndicator({
    Key? key,
    this.color = Colors.white,
    this.backgroundColor = Colors.green,
  }) : super(key: key);

  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset("assets/icons/app_icon.png")
                  ),
      ),
    );
  }
}
