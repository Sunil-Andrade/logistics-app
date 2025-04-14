import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporters/company/bloc/company_bloc.dart';

import 'package:transporters/consumer/track%20order/bloc/order_bloc.dart';

class CompOrders extends StatelessWidget {
  const CompOrders({super.key});

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
            if (state is CompanyOrdersL) {
              return ListView.builder(
                itemCount: state.orderDetails.length,
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
                              "ID: ${state.orderDetails[index].id}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Name: ${state.orderDetails[index].name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "From: ${state.orderDetails[index].from}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "To: ${state.orderDetails[index].to}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Delivered: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                state.orderDetails[index].isDel
                                    ? const CircleAvatar(
                                        backgroundColor: Colors.green,
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.cancel,
                                          color: Colors.white,
                                        ),
                                      )
                              ],
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
