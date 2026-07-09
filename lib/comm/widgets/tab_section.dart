import 'package:flutter/material.dart';

class TabItem {
  const TabItem({required this.label, required this.content});
  final String label;
  final Widget content;
}

class TabsSection extends StatefulWidget {
  const TabsSection({super.key, required this.tabs});

  final List<TabItem> tabs;

  @override
  State<TabsSection> createState() => _TabsSectionState();
}

class _TabsSectionState extends State<TabsSection> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(widget.tabs.length, (index) {
            final isSelected = selectedTab == index;
            return InkWell(
              onTap: () => setState(() => selectedTab = index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? Colors.purple : Colors.grey,
                      width: 3,
                    ),
                    left: const BorderSide(color: Colors.grey),
                    right: const BorderSide(color: Colors.grey),
                  ),
                ),
                child: Text(
                  widget.tabs[index].label,
                  style: TextStyle(
                    color: isSelected ? Colors.purple : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
        widget.tabs[selectedTab].content, 
      ],
    );
  }
}