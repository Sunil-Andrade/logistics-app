import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:transporters/screen/home/widgets/nav_option.dart';

class CompanyHome extends StatefulWidget {
  CompanyHome({super.key, required this.index});

  int index;

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
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
            iconData: Boxicons.bx_cube,
            label: "Manage Shipment",
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
            iconData: Boxicons.bx_user,
            label: "Employee",
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
            iconData: Boxicons.bxs_cart,
            label: "Orders",
            isClicked: widget.index == 3,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 4;
            });
          },
          child: NavOption(
            iconData: Boxicons.bx_user_circle,
            label: "Users",
            isClicked: widget.index == 4,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 5;
            });
          },
          child: NavOption(
            iconData: Boxicons.bxs_business,
            label: "Ports",
            isClicked: widget.index == 5,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 6;
            });
          },
          child: NavOption(
            iconData: Boxicons.bxs_ship,
            label: "Ship",
            isClicked: widget.index == 6,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 7;
            });
          },
          child: NavOption(
            iconData: Icons.settings,
            label: "Setting",
            isClicked: widget.index == 7,
          ),
        ),
      ],
    );
  }
}
