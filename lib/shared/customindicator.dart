import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 5,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
