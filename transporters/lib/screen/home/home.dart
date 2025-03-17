import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:transporters/order/screen/order_screen.dart';
import 'package:transporters/screen/home/user/cubit/user_cubit.dart';

import 'package:transporters/screen/home/widgets/sidebar.dart';
import 'package:transporters/screen/home/user/user%20widgets/user_home_page.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.index, required this.id});

  final int index;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        children: [
          Sidebar(
            who: index,
            id: id,
          ),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              switch (state) {
                case HomePageS():
                  return const UserHomePage();
                case ShipNowS():
                  return const OrderScreen();
                case TrackShipS():
                  return Center(child: Text("Track"));
                case SettingS():
                  return Center(child: Text("Setting"));
                case UserInitial():
                  return UserHomePage();
              }
            },
          )
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
