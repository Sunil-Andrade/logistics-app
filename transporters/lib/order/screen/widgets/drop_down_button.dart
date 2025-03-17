import 'dart:collection';

import 'package:flutter/material.dart';

class CstmDropDownButton extends StatefulWidget {
  const CstmDropDownButton(
      {super.key, required this.list, required this.label});

  final List<String> list;
  final String label;

  @override
  State<CstmDropDownButton> createState() => _CstmDropDownButtonState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _CstmDropDownButtonState extends State<CstmDropDownButton> {
  @override
  Widget build(BuildContext context) {
    final List<MenuEntry> menuEntries =
        widget.list.map((name) => MenuEntry(label: name, value: name)).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label, // Purpose label
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          DropdownMenu(
            initialSelection: widget.list.first,
            width: 600,
            onSelected: (value) {},
            dropdownMenuEntries: menuEntries,
          ),
        ],
      ),
    );
  }
}
