import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transporters/const_val.dart';
import 'package:transporters/state/cubit/sidebar_cubit.dart';
import 'package:transporters/widgets/nav_widgets/sidebar.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.widget, required this.constVal});

  final Widget widget;
  final ConstVal constVal;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = () {
      if (location.startsWith("/trackorder")) return 2;
      if (location.startsWith("/order")) return 1;
      if (location.startsWith("/home")) return 0;

      return 0;
    }();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        children: [
          BlocBuilder<SidebarCubit, int>(
            builder: (context, state) {
              return Sidebar(who: state, id: constVal.userID!);
            },
          ),
          Expanded(child: widget),
        ],
      ),
    );
  }
}

//for user

/* 
#setting
#add order
#orders
*/

//for employy
/*
#setting
#assign ship
#orders
#ships
*/

//for company
/* 
#orders
#employs
#ports
#ships
*/
