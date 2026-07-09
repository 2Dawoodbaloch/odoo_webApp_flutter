import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/help_tool_tip.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.labelWidth,
    this.color,
    this.tooltip, 
    this.onTap,
    this.fontSize
  });

  final double? labelWidth,fontSize;
  final FontWeight? fontWeight;
  final String text;
  final Color? color;
  final String? tooltip; 
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    final textWidget = InkWell(
      onTap: () {
        
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? AppTextSize.bodyDesktop,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
        ),
      ),
    );

    return SizedBox(
      width: labelWidth,
      child: tooltip == null
          ? textWidget 
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: textWidget), 
                const SizedBox(width: 4),
                HelpTooltip(message: tooltip!),
              ],
            ),
    );
  }
}