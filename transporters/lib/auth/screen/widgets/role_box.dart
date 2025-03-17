import 'package:flutter/material.dart';

class RoleBox extends StatelessWidget {
  const RoleBox({
    super.key,
    required this.isClicked,
    required this.label,
  });

  final bool isClicked;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: isClicked ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isClicked ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
