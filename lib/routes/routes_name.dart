class RoutesName {
  RoutesName._(); // prevents instantiation — pure constants holder

  static const String home = '/';
  static const String employeeHome = '/employee-home';
  static const String createEmployee = '/create-employee';
  static const String accountingHome = '/accounting-home';
  static const String dashboard = "/dashboard";

  // invoices
  static const String customerInvoices = "/CustomersInvoices";
  static const String createInvoices = "/createInvoices";
  
  // journal 
  static const String journalEntries = "/JournalEntries";
  static const String createJournalEntries = "/CreateJournalEntries";
  
  // charts of account
  static const String chartsAccount = "/chartsOfAccounts";
  static const String createChartsAccounts = "/createChartsOfAccounts";

  // payments
    static const String customerPayments = "/customerPayments";
    static const String newPayment = "/newPayment";
  
}
