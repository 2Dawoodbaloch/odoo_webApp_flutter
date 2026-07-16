import 'package:flutter_odoo/comm/model/navbar/nav_menu_data.dart';
import 'package:flutter_odoo/routes/routes_name.dart';

class AccountingMenus {
  AccountingMenus._();

    static const List<NavMenuData> menus = [
    dashboard,
    customers,
    vendors,
    accounting,
    review,
    reporting,
    configuration,
  ];

  // DASHBOARD
  static const dashboard = NavMenuData(
    label: "Dashboard",
    route: RoutesName.dashboard,
  );


  // CUSTOMERS
     static const customers =  NavMenuData(
      label: "Customers",
      sections: [
        NavMenuSection(
          items: [
            NavMenuItem(label: "Invoices", route: RoutesName.customerInvoices),
            NavMenuItem(label: "Credit Notes", route: RoutesName.dashboard),
            NavMenuItem(label: "Payments", route: RoutesName.customerPayments),
            NavMenuItem(label: "Products", route: RoutesName.dashboard),
            NavMenuItem(label: "Customers", route: RoutesName.dashboard),
          ],
        ),
      ],
    );

  // VENDORS

  // vendors
  static const  vendors = NavMenuData(
    label: "Vendors",
    sections: [
      NavMenuSection(
        items: [
          NavMenuItem(label: "Bills", route: RoutesName.dashboard),
          NavMenuItem(label: "Refunds", route: RoutesName.dashboard),
          NavMenuItem(label: "Payments", route: RoutesName.dashboard),
          NavMenuItem(label: "Employee Expenses", route: RoutesName.dashboard),
          NavMenuItem(label: "Products", route: RoutesName.dashboard),
          NavMenuItem(label: "Vendors", route: RoutesName.dashboard),
        ],
      ),
    ],
  );

  // Accounting
  static const accounting = NavMenuData(
    label: "Accounting",
    sections: [
      NavMenuSection(
        title: "Transactions",
        items: [
          NavMenuItem(label: "Journal Entries", route: RoutesName.journalEntries),
        ],
      ),
      NavMenuSection(
        title: "Assets & Liabilities",
        items: [
          NavMenuItem(label: "Assets", route: RoutesName.dashboard),
          NavMenuItem(label: "Loans", route: RoutesName.dashboard),
        ],
      ),
      NavMenuSection(
        title: "Closing",
        items: [
          NavMenuItem(label: "Reconcile", route: RoutesName.dashboard),
          NavMenuItem(label: "Tax Returns", route: RoutesName.dashboard),
          NavMenuItem(label: "Lock Dates...", route: RoutesName.dashboard),
        ],
      ),
    ],
  );

  //     // Review
  static const review = NavMenuData(
    label: "Review",
    sections: [
      NavMenuSection(
        title: "Control",
        items: [
          NavMenuItem(label: "Journal Items", route: RoutesName.dashboard),
          NavMenuItem(label: "Journal Audit", route: RoutesName.dashboard),
        ],
      ),
      NavMenuSection(
        title: "Audit",
        items: [
          NavMenuItem(label: "Working Files", route: RoutesName.dashboard),
          NavMenuItem(label: "Annual Report", route: RoutesName.dashboard),
        ],
      ),
      NavMenuSection(
        title: "Inventory",
        items: [
          NavMenuItem(
            label: "Depreciation Schedule",
            route: RoutesName.dashboard,
          ),
          NavMenuItem(label: "Loan Analysis", route: RoutesName.dashboard),
        ],
      ),
      NavMenuSection(
        title: "Regularization Entries",
        items: [
          NavMenuItem(label: "Deferred Revenues", route: RoutesName.dashboard),
          NavMenuItem(label: "Deferred Expenses", route: RoutesName.dashboard),
        ],
      ),
      // logs
      NavMenuSection(
        title: "Logs",
        items: [NavMenuItem(label: "Audit Trail", route: RoutesName.dashboard)],
      ),
    ],
  );


  //     // Reporting
  static const reporting =     NavMenuData(
        label: "Reporting",
        sections: [
          NavMenuSection(
            title: "Statement Reports",
            items: [
              NavMenuItem(label: "Balance Sheet", route: RoutesName.dashboard),
              NavMenuItem(label: "Profit and Loss", route: RoutesName.dashboard),
              NavMenuItem(
                label: "Cash Flow Statement",
                route: RoutesName.dashboard,
              ),
            ],
          ),

          NavMenuSection(
            title: "Ledgers",
            items: [
              NavMenuItem(label: "Trial Balance", route: RoutesName.dashboard),
              NavMenuItem(label: "General Ledger", route: RoutesName.dashboard),
            ],
          ),

          NavMenuSection(
            title: "Partner Reports",
            items: [
              NavMenuItem(label: "Partner Ledger", route: RoutesName.dashboard),
              NavMenuItem(label: "Aged Receivable", route: RoutesName.dashboard),
              NavMenuItem(label: "Aged Payable", route: RoutesName.dashboard),
            ],
          ),

          NavMenuSection(
            title: "Taxes & Fiscal",
            items: [
              NavMenuItem(label: "Tax Report", route: RoutesName.dashboard),
              NavMenuItem(label: "Fiscal Report", route: RoutesName.dashboard),
            ],
          ),

          NavMenuSection(
            title: "Management",
            items: [
              NavMenuItem(label: "Invoice Analysis", route: RoutesName.dashboard),
              NavMenuItem(label: "Analytic Report", route: RoutesName.dashboard),
              NavMenuItem(
                label: "Executive Summary",
                route: RoutesName.dashboard,
              ),
            ],
          ),
        ],
      );




  //     // Configuration
   static const configuration =    NavMenuData(
        label: "Configuration",
        sections: [
          NavMenuSection(
            title: "Settings",
            items: [NavMenuItem(label: "Settings", route: RoutesName.dashboard)],
          ),

          NavMenuSection(
            title: "Accounting",
            items: [
              NavMenuItem(
                label: "Chart of Accounts",
                route: RoutesName.chartsAccount,
              ),
              NavMenuItem(label: "Taxes", route: RoutesName.dashboard),
              NavMenuItem(label: "Journals", route: RoutesName.dashboard),
              NavMenuItem(label: "Currencies", route: RoutesName.dashboard),
              NavMenuItem(label: "Fiscal Positions", route: RoutesName.dashboard),
              NavMenuItem(label: "Multi-Ledger", route: RoutesName.dashboard),
              NavMenuItem(label: "Checks", route: RoutesName.dashboard),
              NavMenuItem(
                label: "Depreciation Models",
                route: RoutesName.dashboard,
              ),
              NavMenuItem(label: "Return Types", route: RoutesName.dashboard),
            ],
          ),

          NavMenuSection(
            title: "Invoicing",
            items: [
              NavMenuItem(label: "Payment Terms", route: RoutesName.dashboard),
              NavMenuItem(
                label: "Product Categories",
                route: RoutesName.dashboard,
              ),
            ],
          ),

          NavMenuSection(
            title: "Online Payments",
            items: [
              NavMenuItem(
                label: "Payment Providers",
                route: RoutesName.dashboard,
              ),
              NavMenuItem(label: "Payment Methods", route: RoutesName.dashboard),
            ],
          ),
        ],
      );
  //   ];
}

// import 'package:flutter_odoo/features/accounting_finace/home/model/nav_menu_data.dart';
// import 'package:flutter_odoo/utils/constants/routes_name.dart';

// class AppNavMenus {
//   AppNavMenus._();

//   static const List<NavMenuData> accountingNav = [
//     NavMenuData(label: "Dashboard", route: RoutesName.dashboard),

//     NavMenuData(
//       label: "Customers",
//       sections: [
//         NavMenuSection(
//           items: [
//             NavMenuItem(label: "Invoices", route: RoutesName.dashboard),
//             NavMenuItem(label: "Credit Notes", route: RoutesName.dashboard),
//             NavMenuItem(label: "Payments", route: RoutesName.dashboard),
//             NavMenuItem(label: "Products", route: RoutesName.dashboard),
//             NavMenuItem(label: "Customers", route: RoutesName.dashboard),
//           ],
//         ),
//       ],
//     ),

//     // vendors
//     NavMenuData(
//       label: "Vendors",
//       sections: [
//         NavMenuSection(
//           items: [
//             NavMenuItem(label: "Bills", route: RoutesName.dashboard),
//             NavMenuItem(label: "Refunds", route: RoutesName.dashboard),
//             NavMenuItem(label: "Payments", route: RoutesName.dashboard),
//             NavMenuItem(
//               label: "Employee Expenses",
//               route: RoutesName.dashboard,
//             ),
//             NavMenuItem(label: "Products", route: RoutesName.dashboard),
//             NavMenuItem(label: "Vendors", route: RoutesName.dashboard),
//           ],
//         ),
//       ],
//     ),

//     // Accounting
//     NavMenuData(
//       label: "Accounting",
//       sections: [
//         NavMenuSection(
//           title: "Transactions",
//           items: [
//             NavMenuItem(label: "Journal Entries", route: RoutesName.dashboard),
//           ],
//         ),
//         NavMenuSection(
//           title: "Assets & Liabilities",
//           items: [
//             NavMenuItem(label: "Assets", route: RoutesName.dashboard),
//             NavMenuItem(label: "Loans", route: RoutesName.dashboard),
//           ],
//         ),
//         NavMenuSection(
//           title: "Closing",
//           items: [
//             NavMenuItem(label: "Reconcile", route: RoutesName.dashboard),
//             NavMenuItem(label: "Tax Returns", route: RoutesName.dashboard),
//             NavMenuItem(label: "Lock Dates...", route: RoutesName.dashboard),
//           ],
//         ),
//       ],
//     ),

//     // Review
//     NavMenuData(
//       label: "Review",
//       sections: [
//         NavMenuSection(
//           title: "Control",
//           items: [
//             NavMenuItem(label: "Journal Items", route: RoutesName.dashboard),
//             NavMenuItem(label: "Journal Audit", route: RoutesName.dashboard),
//           ],
//         ),
//         NavMenuSection(
//           title: "Audit",
//           items: [
//             NavMenuItem(label: "Working Files", route: RoutesName.dashboard),
//             NavMenuItem(label: "Annual Report", route: RoutesName.dashboard),
//           ],
//         ),
//         NavMenuSection(
//           title: "Inventory",
//           items: [
//             NavMenuItem(
//               label: "Depreciation Schedule",
//               route: RoutesName.dashboard,
//             ),
//             NavMenuItem(label: "Loan Analysis", route: RoutesName.dashboard),
//           ],
//         ),
//         NavMenuSection(
//           title: "Regularization Entries",
//           items: [
//             NavMenuItem(
//               label: "Deferred Revenues",
//               route: RoutesName.dashboard,
//             ),
//             NavMenuItem(
//               label: "Deferred Expenses",
//               route: RoutesName.dashboard,
//             ),
//           ],
//         ),

//         // logs
//         NavMenuSection(
//           title: "Logs",
//           items: [
//             NavMenuItem(label: "Audit Trail", route: RoutesName.dashboard),
//           ],
//         ),
//       ],
//     ),

//     // Reporting
//     // Reporting
//     NavMenuData(
//       label: "Reporting",
//       sections: [
//         NavMenuSection(
//           title: "Statement Reports",
//           items: [
//             NavMenuItem(label: "Balance Sheet", route: RoutesName.dashboard),
//             NavMenuItem(label: "Profit and Loss", route: RoutesName.dashboard),
//             NavMenuItem(
//               label: "Cash Flow Statement",
//               route: RoutesName.dashboard,
//             ),
//           ],
//         ),

//         NavMenuSection(
//           title: "Ledgers",
//           items: [
//             NavMenuItem(label: "Trial Balance", route: RoutesName.dashboard),
//             NavMenuItem(label: "General Ledger", route: RoutesName.dashboard),
//           ],
//         ),

//         NavMenuSection(
//           title: "Partner Reports",
//           items: [
//             NavMenuItem(label: "Partner Ledger", route: RoutesName.dashboard),
//             NavMenuItem(label: "Aged Receivable", route: RoutesName.dashboard),
//             NavMenuItem(label: "Aged Payable", route: RoutesName.dashboard),
//           ],
//         ),

//         NavMenuSection(
//           title: "Taxes & Fiscal",
//           items: [
//             NavMenuItem(label: "Tax Report", route: RoutesName.dashboard),
//             NavMenuItem(label: "Fiscal Report", route: RoutesName.dashboard),
//           ],
//         ),

//         NavMenuSection(
//           title: "Management",
//           items: [
//             NavMenuItem(label: "Invoice Analysis", route: RoutesName.dashboard),
//             NavMenuItem(label: "Analytic Report", route: RoutesName.dashboard),
//             NavMenuItem(
//               label: "Executive Summary",
//               route: RoutesName.dashboard,
//             ),
//           ],
//         ),
//       ],
//     ),

//     // Configuration
//     NavMenuData(
//       label: "Configuration",
//       sections: [
//         NavMenuSection(
//           title: "Settings",
//           items: [NavMenuItem(label: "Settings", route: RoutesName.dashboard)],
//         ),

//         NavMenuSection(
//           title: "Accounting",
//           items: [
//             NavMenuItem(
//               label: "Chart of Accounts",
//               route: RoutesName.dashboard,
//             ),
//             NavMenuItem(label: "Taxes", route: RoutesName.dashboard),
//             NavMenuItem(label: "Journals", route: RoutesName.dashboard),
//             NavMenuItem(label: "Currencies", route: RoutesName.dashboard),
//             NavMenuItem(label: "Fiscal Positions", route: RoutesName.dashboard),
//             NavMenuItem(label: "Multi-Ledger", route: RoutesName.dashboard),
//             NavMenuItem(label: "Checks", route: RoutesName.dashboard),
//             NavMenuItem(
//               label: "Depreciation Models",
//               route: RoutesName.dashboard,
//             ),
//             NavMenuItem(label: "Return Types", route: RoutesName.dashboard),
//           ],
//         ),

//         NavMenuSection(
//           title: "Invoicing",
//           items: [
//             NavMenuItem(label: "Payment Terms", route: RoutesName.dashboard),
//             NavMenuItem(
//               label: "Product Categories",
//               route: RoutesName.dashboard,
//             ),
//           ],
//         ),

//         NavMenuSection(
//           title: "Online Payments",
//           items: [
//             NavMenuItem(
//               label: "Payment Providers",
//               route: RoutesName.dashboard,
//             ),
//             NavMenuItem(label: "Payment Methods", route: RoutesName.dashboard),
//           ],
//         ),
//       ],
//     ),
//   ];
// }
