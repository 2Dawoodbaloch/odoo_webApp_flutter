import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
   this.controller, 
    this.icon,
    this.hint,
    this.onChanged,
    this.fontSize,
    this.suffixIcon,
    this.enableBorder = true,
    this.suffixText,
    this.keyboardType,
    this.isTable = false,
  });

  final TextEditingController? controller; 
  final TextInputType? keyboardType;
  final String? suffixText;
  final IconData? icon;
  final String? hint;
  final IconData? suffixIcon;
  final double? fontSize;
  final ValueChanged<String>? onChanged;
  final bool enableBorder;
  final bool isTable;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _isHovering = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    widget.controller!.addListener(_onTextChange); 
  }

  void _onFocusChange() => setState(() {});
  void _onTextChange() => setState(() {});

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    widget.controller!.removeListener(_onTextChange);
    // ✅ NO widget.controller.dispose() here — the CALLER owns it now, always
    super.dispose();
  }

  bool get _hasText => widget.controller!.text.isNotEmpty;

  Color get _lineColor {
    if (widget.isTable) return Colors.transparent;
    if (!widget.enableBorder) return Colors.transparent;
    if (_focusNode.hasFocus) return const Color.fromARGB(255, 34, 69, 35);
    if (_isHovering) return Colors.grey.shade400;
    if (_hasText) return Colors.grey.shade400;
    return Colors.transparent;
  }

  double get _lineWidth => 0.5;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextField(
        controller: widget.controller, // ✅ used directly, no _controller alias needed
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        style: TextStyle(fontSize: AppTextSize.bodyDesktop),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, size: 18, color: Colors.grey.shade600)
              : null,
          prefixIconConstraints: widget.icon != null
              ? const BoxConstraints(minWidth: 30, minHeight: 20)
              : null,
          suffixIcon: widget.suffixIcon != null
              ? Icon(widget.suffixIcon, color: Colors.green)
              : null,
          suffixText: widget.suffixText,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: InputBorder.none,
          enabledBorder: widget.isTable
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: _lineColor, width: _lineWidth),
                ),
          focusedBorder: widget.isTable
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: _lineColor, width: _lineWidth),
                ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_odoo/utils/constants/app_text_size.dart';

// class CustomFormField extends StatefulWidget {
//   const CustomFormField({
//     super.key,
//     this.icon,
//     this.hint,
//     this.controller,
//     this.onChanged,
//     this.fontSize,
//     this.suffixIcon,
//     this.enableBorder = true,
//     this.suffixText, // ✅ new
//     this.keyboardType, // ✅ new
//     this.isTable = false,
//   });

//   final TextInputType? keyboardType;
//   final String? suffixText;
//   final IconData? icon;
//   final String? hint;
//   final IconData? suffixIcon;
//   final double? fontSize;
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged;
//   final bool enableBorder;
//   final bool isTable;

//   @override
//   State<CustomFormField> createState() => _CustomFormFieldState();
// }

// class _CustomFormFieldState extends State<CustomFormField> {
//   late final TextEditingController _controller;
//   bool _ownsController = false;
//   bool _isHovering = false;
//   final FocusNode _focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.controller != null) {
//       _controller = widget.controller!;
//     } else {
//       _controller = TextEditingController();
//       _ownsController = true;
//     }
//     _focusNode.addListener(_onFocusChange);
//     _controller.addListener(_onTextChange);
//   }

//   void _onFocusChange() => setState(() {});
//   void _onTextChange() => setState(() {});

//   @override
//   void dispose() {
//     _focusNode.removeListener(_onFocusChange);
//     _focusNode.dispose();
//     _controller.removeListener(_onTextChange);
//     if (_ownsController) _controller.dispose();
//     super.dispose();
//   }

//   bool get _hasText => _controller.text.isNotEmpty;

//   Color get _lineColor {
//     if (widget.isTable) return Colors.transparent; 
//     if (!widget.enableBorder) return Colors.transparent;
//     if (_focusNode.hasFocus) return const Color.fromARGB(255, 34, 69, 35);
//     if (_isHovering) return Colors.grey.shade400;
//     if (_hasText) return Colors.grey.shade400;
//     return Colors.transparent;
//   }

//   double get _lineWidth => _focusNode.hasFocus ? 0.5 : 0.5;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: TextField(
//         controller: _controller,
//         focusNode: _focusNode,
//         onChanged: widget.onChanged,
//         keyboardType: widget.keyboardType,
//         style: TextStyle(fontSize: AppTextSize.bodyDesktop),
//         decoration: InputDecoration(
//           isDense: true,

//           contentPadding: EdgeInsets.zero,
//           prefixIcon: widget.icon != null
//               ? Icon(widget.icon, size: 18, color: Colors.grey.shade600)
//               : null,
//           prefixIconConstraints: widget.icon != null
//               ? const BoxConstraints(minWidth: 30, minHeight: 20)
//               : null,
//           suffixIcon: widget.suffixIcon != null
//               ? Icon(widget.suffixIcon, color: Colors.green)
//               : null,
//           suffixText: widget.suffixText,
//           hintText: widget.hint,
//           hintStyle: TextStyle(color: Colors.grey.shade500),
//           border: InputBorder.none,
//           enabledBorder: widget.isTable
//               ? InputBorder.none
//               : UnderlineInputBorder(
//                   borderSide: BorderSide(color: _lineColor, width: _lineWidth),
//                 ),
//           focusedBorder: widget.isTable
//               ? InputBorder.none
//               : UnderlineInputBorder(
//                   borderSide: BorderSide(color: _lineColor, width: _lineWidth),
//                 ),
//         ),
//       ),
//     );
//   }
// }
