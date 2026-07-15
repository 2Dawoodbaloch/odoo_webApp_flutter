import 'package:flutter/material.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    super.key,
    this.controller, 
    this.hint = "mm/dd/yyyy",
    this.selectedDate,
    this.onDateSelected,
  });

  final TextEditingController? controller; 
  final String hint;
  final DateTime? selectedDate; // caller tells us what's currently selected
  final ValueChanged<DateTime>? onDateSelected;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  bool _isHovering = false;

  Future<void> _pickDate() async {
    final picked = await showDialog<DateTime>(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.red.shade600,
                  onPrimary: Colors.white,
                  onSurface: Colors.black87,
                ),
              ),
              child: SizedBox(
                width: 320,
                height: 380,
                child: CalendarDatePicker(
                  initialDate: widget.selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  onDateChanged: (date) => Navigator.of(context).pop(date),
                ),
              ),
            ),
          ),
        );
      },
    );

    if (picked != null) {
      widget.onDateSelected?.call(picked); 
    }
  }

  Color get _lineColor => _isHovering ? Colors.grey.shade400 : Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextField(
        controller: widget.controller!, 
        readOnly: true,
        onTap: _pickDate,
         style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          isDense: true,
          isCollapsed: true,
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: _lineColor)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.5)),
        ),
      ),
    );
  }
}