import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporters/company/bloc/company_bloc.dart';

import 'package:transporters/consumer/track%20order/bloc/order_bloc.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 30),
      child: Container(
        width: 600,
        height: 680,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocBuilder<CompanyBloc, CompanyState>(
          builder: (context, state) {
            if (state is CompanyEmplL) {
              return ListView.builder(
                itemCount: state.employees.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              "ID: ${state.employees[index].id}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Name: ${state.employees[index].name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Email: ${state.employees[index].emial}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                  child: Text(
                "No orders or error loading orders",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}
