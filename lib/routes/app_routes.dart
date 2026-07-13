import 'package:flutter_odoo/bindings/journal_binding.dart';
import 'package:flutter_odoo/features/accounting/view/accounting_home_screen.dart';
import 'package:flutter_odoo/features/accounting/view/charts_of_accounts/view/charts_accounts_home.dart';
import 'package:flutter_odoo/features/accounting/view/charts_of_accounts/view/create_charts_accounts/create_charts_account.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/create_invoice.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/invoices.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/create_journal_entries.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/journal_entries_home.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/create_new_employee_screen.dart';
import 'package:flutter_odoo/features/employee/view/employee_home_screen.dart';
import 'package:flutter_odoo/home.dart';
import 'package:get/get.dart';
import 'package:flutter_odoo/routes/routes_name.dart';

class AppRouter {
  AppRouter._();

  static final List<GetPage> pages = [
    GetPage(name: RoutesName.home, page: () => const HomeScreen()),
    GetPage(
      name: RoutesName.employeeHome,
      page: () => const EmployeeHomeScreen(),
    ),
    GetPage(
      name: RoutesName.createEmployee,
      page: () => const CreaateNewEmployeeScreen(),
    ),
    GetPage(
      name: RoutesName.customerInvoices,
      page: () => const CustomersInvoices(),
    ),
    GetPage(
      name: RoutesName.accountingHome,
      page: () => const AccountingHomeScreen(),
    ),
    GetPage(name: RoutesName.createInvoices, page: () => const CreateInvoice()),
    GetPage(
      name: RoutesName.journalEntries,
      page: () => const JournalEntriesHome(),
    ),
    GetPage(
      name: RoutesName.createJournalEntries,
      page: () => const CreateJournalEntries(),
      binding: JournalBinding()
    ),

   
   // charts of accounts
       GetPage(
      name: RoutesName.chartsAccount,
      page: () => const ChartsAccountsHomeScreen(),
    ),
        GetPage(
      name: RoutesName.createChartsAccounts,
      page: () => const CreateChartsAccountScreen(),
    ),




  ];
}
