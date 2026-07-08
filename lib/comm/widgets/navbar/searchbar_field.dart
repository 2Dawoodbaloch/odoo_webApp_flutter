import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';

class SearchBarfield extends StatelessWidget {
  const SearchBarfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 400,
        height: 30,
        child: TextField(
          decoration: InputDecoration(
            hint: Text(
              'Search',
              style: TextStyle(
                fontSize: AppTextSize.bodyDesktop,
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}