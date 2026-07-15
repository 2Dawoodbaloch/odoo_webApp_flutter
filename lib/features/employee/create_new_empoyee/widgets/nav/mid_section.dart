import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/compact_tile.dart';

class MidSection extends StatelessWidget {
  const MidSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CompactTile(
          leadingIcon: Icons.edit_document,
          title: "document",
          subtitle: "Consultant",
          onTap: () {},
        ),
      ),
    );
  }
}