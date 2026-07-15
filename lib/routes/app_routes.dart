import 'package:flutter_odoo/bindings/create_invoice_binding.dart';
import 'package:flutter_odoo/bindings/create_journal_binding.dart';
import 'package:flutter_odoo/bindings/invoice_binding.dart';
import 'package:flutter_odoo/bindings/journal_binding.dart';
import 'package:flutter_odoo/bindings/add_payment_binding.dart';
import 'package:flutter_odoo/bindings/payment_binding.dart';
import 'package:flutter_odoo/features/accounting/view/accounting_home_screen.dart';
import 'package:flutter_odoo/features/accounting/view/charts_of_accounts/view/charts_accounts_home.dart';
import 'package:flutter_odoo/features/accounting/view/charts_of_accounts/view/create_charts_accounts/create_charts_account.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/create_invoice.dart';
import 'package:flutter_odoo/features/customers/invoices/view/invoices.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/create_journal_entries.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/journal_entries_home.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/new_payment_screen.dart';
import 'package:flutter_odoo/features/customers/payments/view/payment_home_screen.dart';
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
      name: RoutesName.accountingHome,
      page: () => const AccountingHomeScreen(),
    ),


    // Customer Invoices
    GetPage(
      name: RoutesName.customerInvoices,
      page: () => const CustomersInvoices(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: RoutesName.createInvoices,
      page: () => const CreateInvoice(),
      binding: CreateInvoiceBinding(),
    ),


    // Accounting Journals
    GetPage(
      name: RoutesName.journalEntries,
      page: () => const JournalEntriesHome(),
      binding: JournalBinding()
    ),
    GetPage(
      name: RoutesName.createJournalEntries,
      page: () => const CreateJournalEntries(),
      binding: CreateJournalBinding(),
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

    // customer payments
    GetPage(
      name: RoutesName.customerPayments,
      page: () => const PaymentHomeScreen(),
      binding: PaymentBinding()
    ),

    GetPage(
      name: RoutesName.newPayment,
      page: () => const NewPaymentHomeScreen(),
      binding: AddPaymentBinding(),
    ),
  ];
}
