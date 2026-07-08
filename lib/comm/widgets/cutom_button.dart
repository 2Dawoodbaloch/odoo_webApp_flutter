import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.radius = 8,
    this.onPressed,
    this.alignment,
    this.borderColor,      // ✅ null = no border
    this.borderWidth = 1,
    this.textSize = 14  ,
    this.fontWeight 
  });

  final String title;
  final double? width, height,textSize;
  final Color? backgroundColor, textColor;
  final double radius;
  final AlignmentGeometry? alignment;
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback? onPressed;
  final FontWeight? fontWeight;
  


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius),
          // ✅ only creates a Border if borderColor was explicitly passed
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
        ),
        child: Align(
          alignment: alignment ?? Alignment.center,
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Text(
            title,
            style: TextStyle(color: textColor ?? Colors.black,fontSize: textSize,fontWeight:  fontWeight ?? FontWeight.w500 ),
          ),
        ),
      ),
    );
  }
}