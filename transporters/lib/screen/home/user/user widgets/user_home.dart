import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:transporters/main.dart';
import 'package:transporters/screen/home/user/cubit/user_cubit.dart';
import 'package:transporters/screen/home/widgets/nav_option.dart';
import 'package:transporters/screen/home/widgets/sidebar.dart';

class UserHome extends StatefulWidget {
  UserHome({super.key, required this.index});

  int index;

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  void changeState(int number) {
    context.read<UserCubit>().getNum(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 0;
            });
            changeState(widget.index);
          },
          child: NavOption(
            iconData: Boxicons.bx_home,
            label: "Home",
            isClicked: widget.index == 0,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 1;
            });
            changeState(widget.index);
          },
          child: NavOption(
            iconData: Boxicons.bxs_truck,
            label: "Ship Now",
            isClicked: widget.index == 1,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 2;
            });
            changeState(widget.index);
          },
          child: NavOption(
            iconData: Icons.location_searching,
            label: "Track Shipment",
            isClicked: widget.index == 2,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.index = 3;
            });
            changeState(widget.index);
          },
          child: NavOption(
            iconData: Icons.settings,
            label: "Setting",
            isClicked: widget.index == 3,
          ),
        ),
      ],
    );
  }
}
