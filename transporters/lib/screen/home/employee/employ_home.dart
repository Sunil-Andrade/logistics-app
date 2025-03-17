import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:transporters/screen/home/widgets/nav_option.dart';

class EmployHome extends StatefulWidget {
  EmployHome({super.key, required this.index});

  int index;

  @override
  State<EmployHome> createState() => _EmployHomeState();
}

class _EmployHomeState extends State<EmployHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 0;
            });
          },
          child: NavOption(
            iconData: Boxicons.bxs_dashboard,
            label: "Dashboard",
            isClicked: widget.index == 0,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 1;
            });
          },
          child: NavOption(
            iconData: Boxicons.bx_pointer,
            label: "Assign Shipment",
            isClicked: widget.index == 1,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 2;
            });
          },
          child: NavOption(
            iconData: Boxicons.bx_list_check,
            label: "Cargo List",
            isClicked: widget.index == 2,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 3;
            });
          },
          child: NavOption(
            iconData: Boxicons.bxs_user_account,
            label: "Profile",
            isClicked: widget.index == 3,
          ),
        ),
      ],
    );
  }
}
