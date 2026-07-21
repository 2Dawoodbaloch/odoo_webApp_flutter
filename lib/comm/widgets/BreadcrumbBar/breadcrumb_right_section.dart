import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_container.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class BreadcrumbRightSection extends StatelessWidget {
  const BreadcrumbRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(children: [Text("1-7"), Text("/7")]),
        const SizedBox(width: 8),
        Row(
          children: [
            CustomContainer(
              height: AppButtons.heightSm,
              width: AppButtons.widthSm,
              radius: AppButtons.borderRadiusXs,
              color: APPColors.btnGrey,
              icon: Icons.arrow_back_ios_rounded,
            ),
            const SizedBox(width: 4),
            CustomContainer(
              height: AppButtons.heightSm,
              width: AppButtons.widthSm,
              radius: AppButtons.borderRadiusXs,
              color: APPColors.btnGrey,
              icon: Icons.arrow_forward_ios_rounded,
              iconSize: 16,
              iconColor: Colors.black,
            ),
          ],
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            CustomContainer(
              height: AppButtons.heightSm,
              width: AppButtons.widthSm,
              radius: AppButtons.borderRadiusXs,
              color: APPColors.btnGrey,
              icon: Icons.key,
            ),
            const SizedBox(width: 4),
            CustomContainer(
              height: AppButtons.heightSm,
              width: AppButtons.widthSm,
              radius: AppButtons.borderRadiusXs,
              color: APPColors.btnGrey,
              icon: Icons.cloud_circle,
            ),
            const SizedBox(width: 4),
            CustomContainer(
              height: AppButtons.heightSm,
              width: AppButtons.widthSm,
              radius: AppButtons.borderRadiusXs,
              color: APPColors.btnGrey,
              icon: Icons.menu,
            ),
          ],
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_odoo/comm/widgets/custom_container.dart';
// import 'package:flutter_odoo/utils/constants/app_button_size.dart';
// import 'package:flutter_odoo/utils/constants/colors.dart';

// class RightSectionBreadCrumbBar extends StatelessWidget {
//   const RightSectionBreadCrumbBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Row(children: [Text("1-4"), Text("/4")]),
//           SizedBox(width: 8),
//           Row(
//             children: [
//               CustomContainer(
//                 // height: sizeValue,width: sizeValue,
//                 height: AppButtons.heightSm,
//                 width: AppButtons.widthSm,
//                 radius: AppButtons.borderRadiusXs,
//                 color: APPColors.btnGrey,
//                 icon: Icons.arrow_back_ios_rounded,
//               ),
//               SizedBox(width: 4),
//               CustomContainer(
//                 // height: sizeValue,width: sizeValue,
//                 height: AppButtons.heightSm,
//                 width: AppButtons.widthSm,
//                 radius: AppButtons.borderRadiusXs,
//                 color: APPColors.btnGrey,
//                 icon: Icons.arrow_forward_ios_rounded,
//                 iconSize: 16,
//                 iconColor: Colors.black,
//               ),
//             ],
//           ),

//           SizedBox(width: 8),
//           Row(
//             children: [
//               CustomContainer(
//                 // height: sizeValue,width: sizeValue,
//                 height: AppButtons.heightSm,
//                 width: AppButtons.widthSm,
//                 radius: AppButtons.borderRadiusXs,
//                 color: APPColors.btnGrey,
//                 icon: Icons.key,
//               ),
//               SizedBox(width: 4),
//               CustomContainer(
//                 // height: sizeValue,width: sizeValue,
//                 height: AppButtons.heightSm,
//                 width: AppButtons.widthSm,
//                 radius: AppButtons.borderRadiusXs,
//                 color: APPColors.btnGrey,
//                 icon: Icons.cloud_circle,
//               ),
//               SizedBox(width: 4),
//               CustomContainer(
//                 // height: sizeValue,width: sizeValue,
//                 height: AppButtons.heightSm,
//                 width: AppButtons.widthSm,
//                 radius: AppButtons.borderRadiusXs,
//                 color: APPColors.btnGrey,
//                 icon: Icons.menu,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
