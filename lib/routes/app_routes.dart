import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/screens/accounting/accounting_home_screen.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/create_new_employee_screen.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/employee_home_screen.dart';
import 'package:flutter_odoo/home.dart';
import 'package:flutter_odoo/routes/routes_name.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.employeeHome:
        return MaterialPageRoute(builder: (_) => const EmployeeHomeScreen());
      case RoutesName.createEmployee:
        return MaterialPageRoute(
          builder: (_) => const CreaateNewEmployeeScreen(),
          settings: settings,
        );

      case RoutesName.accountingHome:
        return MaterialPageRoute(builder: (_) => AccountingHomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
