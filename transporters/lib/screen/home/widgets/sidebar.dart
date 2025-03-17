import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:transporters/screen/home/company/company_home.dart';
import 'package:transporters/screen/home/employee/employ_home.dart';
import 'package:transporters/screen/home/user/user%20widgets/user_home.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key, required this.who, required this.id});

  final int who;
  final int id;

  @override
  State<Sidebar> createState() => _SidebarState();
}

int index = 0;

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 12),
      height: double.infinity,
      width: 230,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "TransPorters",
              style: TextStyle(
                color: Color.fromARGB(255, 14, 111, 191),
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 30),
          if (widget.who == 0) ...[
            UserHome(index: index),
          ],
          if (widget.who == 1) ...[
            EmployHome(index: index),
          ],
          if (widget.who == 2) ...[
            CompanyHome(index: index),
          ],
          Spacer(),
          Text(widget.id.toString())
        ],
      ),
    );
  }
}
