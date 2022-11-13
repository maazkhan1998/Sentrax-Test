import 'package:flutter/material.dart';

import 'customindicator.dart';

class CustomLoading extends StatelessWidget {
  final String loadingtext;
  const CustomLoading({
    this.loadingtext = "",
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.black45,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomCircularIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  loadingtext.isNotEmpty ? loadingtext : "Loading...",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
