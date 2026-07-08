// import 'package:flutter/material.dart';
// class SimpleDropdown extends StatefulWidget {
//   const SimpleDropdown({
//     super.key,
//     required this.items,
//     required this.onSelected,
//     required this.width,
//   });

//   final List<String> items;
//   final ValueChanged<String?> onSelected;
//   final double width;

//   @override
//   State<SimpleDropdown> createState() => _SimpleDropdownState();
// }

// class _SimpleDropdownState extends State<SimpleDropdown> {
//   bool _isHovering = false;
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: Theme(
//         data: Theme.of(context).copyWith(
//           inputDecorationTheme: InputDecorationTheme(
//             // ✅ removes left/right/top border — only bottom line remains
//             border: const UnderlineInputBorder(),

//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: _isHovering ? Colors.grey : Colors.transparent,
//               ),
//             ),
//             focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black, width: 1.5),
//             ),

//             contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
//           ),
//         ),

//         child: DropdownMenu<String>(
//           width: widget.width,
//           showTrailingIcon: _isHovering ? true : false,
//           menuStyle: MenuStyle(
//             minimumSize: WidgetStateProperty.all(Size(200, 0)),
//             maximumSize: WidgetStateProperty.all(
//               Size(200, 300), // 300 = max popup height
//             ),
//             backgroundColor: WidgetStateProperty.all(Colors.white),
//             elevation: WidgetStateProperty.all(4),
//             shape: WidgetStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             ),
//           ),
//           enableFilter: true,
//           onSelected: widget.onSelected,
//           dropdownMenuEntries: widget.items.map((item) {
//             return DropdownMenuEntry<String>(value: item, label: item);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
