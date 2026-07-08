import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_container.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class RightSectionNav extends StatelessWidget {
  const RightSectionNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: [Text("1-4"), Text("/4")]),
          SizedBox(width: 8),
          Row(
            children: [
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.arrow_back_ios_rounded,
              ),
              SizedBox(width: 4),
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.arrow_forward_ios_rounded,
                iconSize: 16,
                iconColor: Colors.black,
              ),
            ],
          ),

          SizedBox(width: 8),
          Row(
            children: [
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.key,
              ),
              SizedBox(width: 4),
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.cloud_circle,
              ),
              SizedBox(width: 4),
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.menu,
              ),
              SizedBox(width: 4),
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.watch,
              ),
              SizedBox(width: 4),
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.image,
              ),
              SizedBox(width: 4),
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: AppButtonSize.heightSm,
                width: AppButtonSize.widthSm,
                radius: AppButtonSize.borderRadiusXs,
                color: APPColors.btnGrey,
                icon: Icons.pivot_table_chart,
              ),
            ],
          ),
          // TextContainer(text: "New",height: size.height * 0.06,width: size.width * 0.06,)
        ],
      ),
    );
  }
}
