// import 'package:flutter/material.dart';
// import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
// import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
// import 'package:flutter_odoo/features/charts_of_accounts/controller/chartsof_account_controller.dart';
// import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/controller/create_chart_Of_accounts_controller.dart';
// import 'package:flutter_odoo/utils/constants/app_button_size.dart';
// import 'package:flutter_odoo/utils/constants/colors.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';

// class ChartsBreadCrumber extends StatelessWidget {
//   const ChartsBreadCrumber({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//          final controller = Get.find<CreateChartOfAccountsController>();
//     return BreadcrumbBar(
//       title: "Charts of Accounts",
//       actions: [
//         CustomButton(
//           title: "New",
//           onPressed: () {
//             controller.postAccount();
//             Get.back();
//           },
//           backgroundColor: APPColors.btnPurple,
//           padding: AppButtons.btnPaddingSymm,
//           textColor: APPColors.white,
//         ),
//       ],
//     );
//   }
// }
