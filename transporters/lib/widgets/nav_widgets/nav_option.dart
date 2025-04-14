import 'package:flutter/material.dart';

class NavOption extends StatelessWidget {
  const NavOption(
      {super.key,
      required this.isClicked,
      required this.label,
      required this.iconData});

  final IconData iconData;
  final String label;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: isClicked
              ? const Color.fromARGB(82, 68, 137, 255)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isClicked ? Colors.blue[900] : Colors.grey[400],
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: isClicked ? Colors.blue[900] : Colors.grey[400],
                fontSize: 16,
                fontWeight: isClicked ? FontWeight.bold : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
