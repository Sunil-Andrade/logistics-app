import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transporters/auth/bloc/auth_bloc.dart';
import 'package:transporters/auth/model/emp_cmp_model.dart';
import 'package:transporters/auth/model/user_model.dart';
import 'package:transporters/auth/screen/widgets/field_container.dart';
import 'package:transporters/auth/screen/widgets/role_box.dart';
import 'package:transporters/const_val.dart';

import 'package:transporters/state/cubit/sidebar_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.constVal});

  final ConstVal constVal;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 20,
          child: Container(
            width: 380,
            height: 580,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 185, 217, 244),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
              ),
              border: Border.all(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Enter your credentials",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: RoleBox(
                        label: "USER",
                        isClicked: index == 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: RoleBox(
                        label: "COMPANY",
                        isClicked: index == 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (index == 0) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FieldContainer(
                        controller: name,
                        label: "Name",
                      ),
                      FieldContainer(
                        controller: email,
                        label: "Email",
                      ),
                      FieldContainer(
                        controller: password,
                        label: "Password",
                        isObsecure: true,
                      ),
                      FieldContainer(
                        controller: address,
                        label: "Address",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
                if (index > 0) ...[
                  FieldContainer(
                    controller: email,
                    label: "Email",
                  ),
                  FieldContainer(
                    controller: password,
                    label: "Password",
                    isObsecure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator(
                        color: Colors.black,
                      );
                    }
                    if (state is AuthFailure) {
                      Future.microtask(() {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Error"),
                            content: Text(state.message),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      });
                    }
                    if (state is AuthSuccess) {
                      if (index == 0) {
                        Future.microtask(() {
                          widget.constVal.userID = state.id;
                          context.read<SidebarCubit>().getIndex(index);
                          context.go('/homescreen');
                        });
                      } else {
                        Future.microtask(() {
                          context.read<SidebarCubit>().getIndex(index);
                          context.go('/homescreen');
                        });
                      }
                    }
                    return GestureDetector(
                      onTap: () {
                        if ((index == 0 && name.text.isEmpty) ||
                            email.text.isEmpty ||
                            password.text.isEmpty ||
                            (index == 0 && address.text.isEmpty)) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("Validation Error"),
                              content: Text("All fields must be filled"),
                            ),
                          );
                          return;
                        }
                        if (index == 0) {
                          context.read<AuthBloc>().add(OnUserLogin(
                              userModel: UserModel(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  address: address.text)));
                        }
                        if (index > 0 && email.text.isEmpty ||
                            password.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("Validation Error"),
                              content: Text("All fields must be filled"),
                            ),
                          );
                          return;
                        }

                        if (index == 1) {
                          context.read<AuthBloc>().add(OnCompanyLogin(
                              empCmpModel: EmpCmpModel(
                                  email: email.text,
                                  password: password.text,
                                  who: index)));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
