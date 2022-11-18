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
      backgroundColor: backgroundColor,
      body: Center(
        child: SizedBox(
          width: 48,
          height: 48,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: color,
          ),
        ),
      ),
    );
  }
}
