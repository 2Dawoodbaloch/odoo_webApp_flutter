import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/utils/constants/app_icon_size.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class LeftSection extends StatelessWidget {
  const LeftSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         CustomButton(title: "New",textColor: APPColors.btnPurple,borderWidth: 1,borderColor: APPColors.btnPurple,),
          SizedBox(width: 8),
          Text(
            "Employee",
            style: TextStyle(
              fontSize: AppTextSize.headingDesktop,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.settings, size: AppIconSize.md),
        ],
      ),
    );
  }
}