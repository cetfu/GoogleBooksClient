import 'package:flutter/material.dart';

class CircularProgressIndicatorWithCenter extends StatelessWidget {
  const CircularProgressIndicatorWithCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
