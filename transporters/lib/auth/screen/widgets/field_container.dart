import 'package:flutter/material.dart';

class FieldContainer extends StatelessWidget {
  const FieldContainer(
      {super.key,
      required this.controller,
      this.isObsecure = false,
      required this.label,
      this.width = double.infinity});

  final TextEditingController controller;
  final String label;
  final bool isObsecure;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: width,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextField(
            obscureText: isObsecure,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
            ),
            controller: controller,
          ),
        ),
      ),
    );
  }
}
