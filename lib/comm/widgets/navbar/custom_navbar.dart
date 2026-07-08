import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/navbar/left_section_nav.dart';
import 'package:flutter_odoo/comm/widgets/navbar/right_section_nav.dart';
import 'package:flutter_odoo/comm/widgets/navbar/searchbar_field.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        const LeftSectionNav(),
        const SearchBarfield(),
        const RightSectionNav(),
        
      ],
    );
  }
}