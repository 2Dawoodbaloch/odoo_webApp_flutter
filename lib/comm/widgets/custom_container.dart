import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';

class CustomContainer extends StatelessWidget {
  final String? text;
  final double? height, width, fontSize,iconSize;
  final double radius;
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  

  const CustomContainer({
    super.key,
   this.text,
    this.height,
    this.width,
    this.fontSize,
    this.color,
    this.icon,
    this.iconSize,
    this.radius = 8,
    this.iconColor,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (icon != null && text != null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor ?? Colors.black, size: iconSize ?? 18),
          const SizedBox(width: 8),
          Text(
            text ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? AppTextSize.bodyDesktop,
            ),
          ),
        ],
      );
    } else if(text == null && icon != null ){
 content = Center(
  child:  Icon(icon, color: Colors.black, size: iconSize ?? 18),
 );
    }
    
     else {
      content = Text(
        text ?? "hello",
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? AppTextSize.bodyDesktop,
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 35,
        width: width ?? 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? Colors.grey,
        ),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.spaceBtwInputFields),
          child: Center(
            child: content,
          ),
        ),
      ),
    );
  }
}