
import 'package:flutter/material.dart';

class RightSection extends StatelessWidget {
  const RightSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Icon(Icons.search_sharp, color: Colors.purple)],
      ),
    );
  }
}