import 'package:flutter/material.dart';

class UserHomeCircle extends StatelessWidget {
  const UserHomeCircle(
      {super.key, required this.iconData, required this.label});

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(300),
          ),
          child: Icon(
            iconData,
            size: 80,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
