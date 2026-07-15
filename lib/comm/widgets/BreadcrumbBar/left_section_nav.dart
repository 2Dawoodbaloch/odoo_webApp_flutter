// import 'package:flutter/material.dart';
// import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
// import 'package:flutter_odoo/features/employee/create_new_empoyee/create_new_employee_screen.dart';
// import 'package:flutter_odoo/utils/constants/app_icon_size.dart';
// import 'package:flutter_odoo/utils/constants/app_spacing.dart';
// import 'package:flutter_odoo/utils/constants/app_text_size.dart';
// import 'package:flutter_odoo/utils/constants/colors.dart';

// class LeftSectionNav extends StatelessWidget {
//   const LeftSectionNav({
//     super.key,
//   });

 
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Row(
//         children: [
//           CustomButton(
//             title: "New",
//             backgroundColor: APPColors.btnPurple,
//             textColor: APPColors.white,
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CreaateNewEmployeeScreen(),
//               ),
//             ),
//           ),
//           SizedBox(width: AppSpacing.sm),
//           Text(
//             "Employees",
//             style: TextStyle(
//               fontSize: AppTextSize.titleDesktop,
//               color:APPColors.black,
//             ),
//           ),
//           SizedBox(width: 8),
//           Icon(Icons.settings, size: AppIconSize.md),
//         ],
//       ),
//     );
//   }
// }