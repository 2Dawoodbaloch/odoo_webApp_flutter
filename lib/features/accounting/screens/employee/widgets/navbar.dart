import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_container.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/texts.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // first row
        Expanded(
          child: Row(
            children: [
              CustomContainer(
                // height: sizeValue,width: sizeValue,
                height: size.height * 0.07,
                width: size.width * 0.04,
                text: AppTexts.btnNew,
                fontSize: AppTextSize.bodyDesktop,
              ),
             SizedBox(width: AppSpacing.xl,),
              Text("Employees"),
           SizedBox(width: AppSpacing.xl,),
              Icon(Icons.settings),
            ],
          ),
        ),
    
        // second row
        Expanded(
          child: Center(
            child: SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.05,
              child: TextField(
                decoration: InputDecoration(
                  hint: Text('Search'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
    
        // third row
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
    
            children: [
              Row(children: [Text("12"), Text("12")]),
            SizedBox(width: AppSpacing.xl,),
              Row(
                children: [
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.black,
                    icon: Icons.arrow_back_ios_rounded,
                  ),
               SizedBox(width: AppSpacing.xxs,),
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.grey,
                    icon: Icons.arrow_forward_ios_rounded,
                    iconSize: 16,
                  ),
                ],
              ),
    
             SizedBox(width: AppSpacing.xl,),
              Row(
                children: [
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.grey,
                    icon: Icons.key,
                  ),
                SizedBox(width: AppSpacing.xxs,),
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.grey,
                    icon: Icons.watch,
                  ),
                 SizedBox(width: AppSpacing.xxs,),
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.grey,
                    icon: Icons.menu,
                  ),
                 SizedBox(width: AppSpacing.xxs,),
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.grey,
                    icon: Icons.watch,
                  ),
                  SizedBox(width: AppSpacing.xxs,),
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.grey,
                    icon: Icons.image,
                  ),
                SizedBox(width: AppSpacing.xxs,),
                  CustomContainer(
                    // height: sizeValue,width: sizeValue,
                    height: size.height * 0.055,
                    width: size.width * 0.025,
                    radius: 2,
                    color: Colors.grey,
                    icon: Icons.pivot_table_chart,
                  ),
                ],
              ),
              // TextContainer(text: "New",height: size.height * 0.06,width: size.width * 0.06,)
            ],
          ),
        ),
      ],
    );
  }
}
