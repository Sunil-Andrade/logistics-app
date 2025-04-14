import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:transporters/consumer/order/model/port_model.dart';

class CstmDropDownButton extends StatefulWidget {
  const CstmDropDownButton({super.key, required this.label, required this.v});

  final String label;
  final void Function(int) v;

  @override
  State<CstmDropDownButton> createState() => _CstmDropDownButtonState();
}

class _CstmDropDownButtonState extends State<CstmDropDownButton> {
  int? selectedID;
  final List<PortModel> ports = [
    PortModel(
      portId: 1,
      name: "Manglore",
    ),
    PortModel(
      portId: 2,
      name: "Mumbai",
    ),
    PortModel(
      portId: 3,
      name: "Kolkata",
    ),
  ];

  @override
  void initState() {
    selectedID = ports.first.portId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<int>> menuEntries = ports
        .map((name) => DropdownMenuEntry(label: name.name, value: name.portId))
        .toList();
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
            initialSelection: selectedID,
            width: double.infinity,
            onSelected: (value) {
              if (value != null) {
                setState(() {
                  selectedID = value;
                });
                widget.v(value);
              }
            },
            dropdownMenuEntries: menuEntries,
          ),
        ],
      ),
    );
  }
}
