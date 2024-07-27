import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  final double width;

  const HSpace(
    this.width, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
