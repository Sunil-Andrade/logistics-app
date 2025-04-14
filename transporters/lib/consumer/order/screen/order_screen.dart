import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporters/auth/screen/widgets/field_container.dart';
import 'package:transporters/consumer/order/bloc/order_bloc.dart';
import 'package:transporters/consumer/order/model/cargo_model.dart';

import 'package:transporters/consumer/order/screen/widgets/drop_down_button.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.userID});

  final int userID;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  bool showIcon = false;
  int to = 0;
  int from = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 30),
      child: Container(
        width: 600,
        height: 680,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Enter Your Cargo Details",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              FieldContainer(
                controller: textEditingController,
                label: "Name",
                width: double.infinity,
              ),
              // BlocBuilder for Dropdown
              CstmDropDownButton(
                label: "From",
                v: (p0) {
                  from = p0;
                },
              ),
              CstmDropDownButton(
                label: "To",
                v: (p0) {
                  to = p0;
                },
              ),
              const SizedBox(height: 20),

              // BlocBuilder for Button
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  if (state is OrderLoading) {
                    return const CircularProgressIndicator(color: Colors.black);
                  } else if (state is OrderPlaced) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 400),
                      height: showIcon ? 40 : 0,
                      width: showIcon ? 40 : 0,
                      child: const Icon(Icons.done, color: Colors.green),
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      context.read<OrderBloc>().add(PlaceOrderE(
                            cargoModel: CargoModel(
                              cargoName: textEditingController.text,
                              to: to,
                              from: from,
                              userId: widget.userID,
                              isDel: false,
                            ),
                          ));
                      setState(() {
                        showIcon = true;
                      });
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
                            "Place Order",
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
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
