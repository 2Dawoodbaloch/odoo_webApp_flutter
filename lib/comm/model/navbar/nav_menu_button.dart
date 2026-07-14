import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/model/nav_menu_data.dart';

class NavMenuButton extends StatefulWidget {
  const NavMenuButton({
    super.key,
    required this.label,
    this.sections = const [],
    this.onTap,
    this.onItemSelected,
  });

  final String label;
  final List<NavMenuSection> sections; // ✅ fixed type
  final VoidCallback? onTap;
  final ValueChanged<String>? onItemSelected;

  @override
  State<NavMenuButton> createState() => _NavMenuButtonState();
}

class _NavMenuButtonState extends State<NavMenuButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: _isHovering ? Colors.grey.shade200 : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(widget.label, style: const TextStyle(fontSize: 14)),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: widget.sections.isEmpty
          ? InkWell(onTap: widget.onTap, child: content)
          : PopupMenuButton<String>(
              offset: const Offset(0, 40),
               color: Colors.white,
              constraints: const BoxConstraints(minWidth: 220),
              itemBuilder: (context) => _buildMenuEntries(),
              onSelected: widget.onItemSelected,
              child: content,
            ),
    );
  }

  List<PopupMenuEntry<String>> _buildMenuEntries() {
    final entries = <PopupMenuEntry<String>>[];

    for (int s = 0; s < widget.sections.length; s++) {
      final section = widget.sections[s];

      if (section.title.isNotEmpty) { 
        entries.add(
          PopupMenuItem<String>(
            enabled: false,
            height: 32,
            child: Text(
              section.title, // ✅ fixed typo
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        );
      }

      for (final item in section.items) {
        entries.add(
          PopupMenuItem<String>(
            value:  item.label,
            child: Text(item.label, style: const TextStyle(fontSize: 14)),
          ),
        );
      }

      if (s != widget.sections.length - 1) {
        entries.add(const PopupMenuDivider());
      }
    }

    return entries;
  }
}