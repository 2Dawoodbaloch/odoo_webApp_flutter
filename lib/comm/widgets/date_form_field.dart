import 'package:flutter/material.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    super.key,
    this.hint = "mm/dd/yyyy",
    this.initialDate,
    this.onDateSelected,
  });

  final String hint;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDateSelected;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  late final TextEditingController _controller;
  DateTime? _selectedDate;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = TextEditingController(
      text: _selectedDate != null ? _formatDate(_selectedDate!) : '',
    );
  }

  String _formatDate(DateTime date) {
    return "${date.month.toString().padLeft(2, '0')}/"
        "${date.day.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

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
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  onDateChanged: (date) => Navigator.of(context).pop(date),
                ),
              ),
            ),
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _formatDate(picked);
      });
      widget.onDateSelected?.call(picked);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _lineColor => _isHovering ? Colors.grey.shade400 : Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextField(
        controller: _controller,
        readOnly: true,
        onTap: _pickDate,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14),
          isDense: true,
          isCollapsed: true,
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _lineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
        ),
      ),
    );
  }
}