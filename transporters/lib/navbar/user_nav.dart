import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:go_router/go_router.dart';
import 'package:transporters/consumer/track%20order/bloc/order_bloc.dart';

import 'package:transporters/widgets/nav_widgets/nav_option.dart';

// ignore: must_be_immutable
class UserHome extends StatefulWidget {
  UserHome({super.key, required this.userId});

  final int userId;

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = () {
      if (location.startsWith("/track")) return 2;
      if (location.startsWith("/order")) return 1;
      if (location.startsWith("/home")) return 0;

      return 0;
    }();
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.go('/homescreen');
          },
          child: NavOption(
            iconData: Boxicons.bx_home,
            label: "Home",
            isClicked: currentIndex == 0,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.go('/order');
          },
          child: NavOption(
            iconData: Boxicons.bxs_truck,
            label: "Ship Now",
            isClicked: currentIndex == 1,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<TOrderBloc>().add(GetOrders(userId: widget.userId));
            context.go('/track');
          },
          child: NavOption(
            iconData: Icons.location_searching,
            label: "Track Shipment",
            isClicked: currentIndex == 2,
          ),
        ),
      ],
    );
  }
}
