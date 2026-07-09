// import 'package:flutter/material.dart';
// import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
// import 'package:flutter_odoo/comm/widgets/navbar/left_section_nav.dart';
// import 'package:flutter_odoo/comm/widgets/navbar/right_section_nav.dart';
// import 'package:flutter_odoo/comm/widgets/navbar/searchbar_field.dart';
// import 'package:flutter_odoo/features/employee/create_new_empoyee/create_new_employee_screen.dart';
// import 'package:flutter_odoo/utils/constants/app_icon_size.dart';
// import 'package:flutter_odoo/utils/constants/app_spacing.dart';
// import 'package:flutter_odoo/utils/constants/app_text_size.dart';
// import 'package:flutter_odoo/utils/constants/colors.dart';

// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [

//         // Right Section Nav
//         Expanded(
//           child: Row(
//             children: [
//               CustomButton(
//                 title: "New",
//                 backgroundColor: APPColors.btnPurple,
//                 textColor: APPColors.white,
//                 onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CreaateNewEmployeeScreen(),
//                   ),
//                 ),
//               ),
//               SizedBox(width: AppSpacing.sm),
//               Text(
//                 "Employees",
//                 style: TextStyle(
//                   fontSize: AppTextSize.titleDesktop,
//                   color: APPColors.black,
//                 ),
//               ),
//               SizedBox(width: 8),
//               Icon(Icons.settings, size: AppIconSize.md),
//             ],
//           ),
//         ),
//         const SearchBarfield(),
//         const RightSectionNav(),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/navbar/right_section_nav.dart';
import 'package:flutter_odoo/comm/widgets/navbar/searchbar_field.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
     this.title,
    this.icon,
    this.actions = const [],
    this.showSearchBar = true,
  });

  final String? title;
  final IconData? icon;

  /// Buttons or widgets shown before title
  final List<Widget> actions;

  final bool showSearchBar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: Row(
            children: [

              ...actions,

              if (actions.isNotEmpty)
                const SizedBox(width: 16),

              Text(
                title ?? "Dashboard",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),

              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon),
              ],
            ],
          ),
        ),

        if (showSearchBar)
          const SearchBarfield(),

        const RightSectionNav(),
      ],
    );
  }
}