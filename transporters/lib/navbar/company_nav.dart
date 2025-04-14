import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:go_router/go_router.dart';
import 'package:transporters/auth/screen/login_screen.dart';
import 'package:transporters/company/bloc/company_bloc.dart';
import 'package:transporters/widgets/nav_widgets/nav_option.dart';

class CompanyHome extends StatefulWidget {
  CompanyHome({super.key});

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = () {
      if (location.startsWith("/userpage")) return 6;
      if (location.startsWith("/ports")) return 5;
      if (location.startsWith("/emppage")) return 4;
      if (location.startsWith("/comporder")) return 3;

      return 3;
    }();
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<CompanyBloc>().add(CGetOrders());
            context.go('/comporder');
          },
          child: NavOption(
            iconData: Boxicons.bxs_cart,
            label: "Orders",
            isClicked: currentIndex == 3,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CompanyBloc>().add(CEmployees());
            context.go('/emppage');
          },
          child: NavOption(
            iconData: Boxicons.bx_user,
            label: "Employees",
            isClicked: currentIndex == 4,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CompanyBloc>().add(CGetPorts());
            context.go('/ports');
          },
          child: NavOption(
            iconData: Boxicons.bxs_ship,
            label: "Ports",
            isClicked: currentIndex == 5,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CompanyBloc>().add(CGetUsers());
            context.go('/userpage');
          },
          child: NavOption(
            iconData: Boxicons.bxs_user_account,
            label: "Users",
            isClicked: currentIndex == 6,
          ),
        ),
      ],
    );
  }
}
