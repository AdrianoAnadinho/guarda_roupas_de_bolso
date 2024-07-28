import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  final bool isDone;

  const CustomIconButton({
    required this.icon,
    required this.onPress,
    required this.isDone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 15,
            child: Icon(
              size: 150.0,
              icon,
            ),
          ),
          if (isDone) ...[
            const Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Icon(
                  size: 18,
                  weight: 50,
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
