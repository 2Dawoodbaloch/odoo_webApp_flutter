import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  const LabeledDivider({
    super.key,
    required this.label,
    this.color,
    this.textStyle,
    this.thickness = 1,
    this.horizontalPadding = 12,
    this.isVertical = false,
  });

  final String label;
  final bool isVertical;
  final Color? color;
  final TextStyle? textStyle;
  final double thickness;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final lineColor = color ?? Colors.grey.shade400;

    if (isVertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: VerticalDivider(
              color: lineColor,
              thickness: thickness,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: horizontalPadding),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                label,
                style: textStyle ??
                    TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
              ),
            ),
          ),

          Expanded(
            child: VerticalDivider(
              color: lineColor,
              thickness: thickness,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: thickness,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            label,
            style: textStyle ??
                TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
          ),
        ),

        Expanded(
          child: Divider(
            color: lineColor,
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}