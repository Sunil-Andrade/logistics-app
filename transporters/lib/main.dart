import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporters/auth/bloc/auth_bloc.dart';
import 'package:transporters/company/bloc/company_bloc.dart';

import 'package:transporters/consumer/order/bloc/order_bloc.dart';
import 'package:transporters/consumer/track%20order/bloc/order_bloc.dart';
import 'package:transporters/screen/routes/page_routes.dart';
import 'package:transporters/state/cubit/sidebar_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
      BlocProvider(create: (context) => SidebarCubit()),
      BlocProvider(create: (context) => OrderBloc()),
      BlocProvider(create: (context) => TOrderBloc()),
      BlocProvider(create: (context) => CompanyBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
