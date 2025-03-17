import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:transporters/screen/home/user/user%20widgets/user_home_circle.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 40, bottom: 20, top: 80, right: 40),
          child: Container(
            width: 1200,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Easy Way to Ship Your Cargo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 80,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "With  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 80,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Icon(
                      Boxicons.bxs_package,
                      size: 120,
                    ),
                    Text(
                      "Transporters",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 80,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    UserHomeCircle(iconData: Boxicons.bx_lock, label: "Safe"),
                    UserHomeCircle(iconData: Boxicons.bx_run, label: "Fast"),
                    UserHomeCircle(iconData: Boxicons.bx_dollar, label: "Cheap")
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
