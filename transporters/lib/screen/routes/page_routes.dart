import 'package:go_router/go_router.dart';
import 'package:transporters/auth/screen/login_screen.dart';
import 'package:transporters/company/pages/comp_orders.dart';
import 'package:transporters/company/pages/employee_page.dart';
import 'package:transporters/company/pages/ports_page.dart';
import 'package:transporters/company/pages/users_page.dart';
import 'package:transporters/const_val.dart';
import 'package:transporters/consumer/order/screen/order_screen.dart';
import 'package:transporters/consumer/track%20order/screen/track_ship_screen.dart';
import 'package:transporters/screen/home/home.dart';
import 'package:transporters/widgets/design/welcome_page.dart';

ConstVal constVal = ConstVal();
final GoRouter goRouter = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginScreen(
      constVal: constVal,
    ),
  ),
  ShellRoute(
    builder: (context, state, child) => Home(
      widget: child,
      constVal: constVal,
    ),
    routes: [
      GoRoute(
        path: '/homescreen',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/order',
        builder: (context, state) => OrderScreen(
          userID: constVal.userID!,
        ),
      ),
      GoRoute(
        path: '/track',
        builder: (context, state) => const TrackShipScreen(),
      ),
      GoRoute(
        path: '/comporder',
        builder: (context, state) => const CompOrders(),
      ),
      GoRoute(
        path: '/emppage',
        builder: (context, state) => const EmployeePage(),
      ),
      GoRoute(
        path: '/ports',
        builder: (context, state) => const PortsPage(),
      ),
      GoRoute(
        path: '/userpage',
        builder: (context, state) => const UsersPage(),
      ),
    ],
  ),
]);
