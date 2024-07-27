import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  final double height;

  const VSpace(
    this.height, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
