import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class SearchableDropdownField<T> extends StatefulWidget {
  const SearchableDropdownField({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.onSelected,
    this.selectedItem,
    this.hintText,
  });

  final List<T> items;
  final String Function(T item) labelBuilder;
  final ValueChanged<T> onSelected;
  final T? selectedItem;
  final String? hintText;

  @override
  State<SearchableDropdownField<T>> createState() =>
      _SearchableDropdownFieldState<T>();
}

class _SearchableDropdownFieldState<T>
    extends State<SearchableDropdownField<T>> {
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;

  OverlayEntry? _overlayEntry;
  List<T> _filteredItems = [];
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.selectedItem == null
          ? ''
          : widget.labelBuilder(widget.selectedItem!),
    );
    _filteredItems = widget.items;
    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  void _onTextChange() => setState(() {});

  @override
  void didUpdateWidget(covariant SearchableDropdownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem != oldWidget.selectedItem) {
      _controller.text = widget.selectedItem == null
          ? ''
          : widget.labelBuilder(widget.selectedItem!);
    }
    if (widget.items != oldWidget.items) {
      _filteredItems = List.from(widget.items);
    }
  }

  void _onFocusChange() {
    setState(() {});
    if (_focusNode.hasFocus) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _filter(String query) {
    setState(() {
      _filteredItems = widget.items
          .where(
            (item) => widget
                .labelBuilder(item)
                .toLowerCase()
                .contains(query.toLowerCase()),
          )
          .toList();
    });
    _overlayEntry?.markNeedsBuild();
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;
    _overlayEntry = _buildOverlay();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry == null) return;
    _overlayEntry!.remove();
    _overlayEntry = null;
  }

  void _selectItem(T item) {
    setState(() {
      _controller.text = widget.labelBuilder(item);
    });
    widget.onSelected(item);
    _removeOverlay();
    _focusNode.unfocus();
  }

  OverlayEntry _buildOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 4),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(6),

            color: Colors.white,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 4),
                shrinkWrap: true,
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return InkWell(
                    onTapDown: (_) => _selectItem(item),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Text(
                        widget.labelBuilder(item),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get _hasText => _controller.text.isNotEmpty;

  Color get _lineColor {
    if (_focusNode.hasFocus) return Colors.black;
    if (_isHovering) return Colors.grey;
    if (_hasText) return Colors.grey; // ✅ new condition
    return Colors.transparent;
  }

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.removeListener(_onTextChange); // ✅ remove the new listener too
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: TextField(
          
          controller: _controller,
          focusNode: _focusNode,
          onChanged: _filter,
          style: TextStyle( fontSize: 14),
          decoration: InputDecoration(
            
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: _isHovering ? APPColors.hintText : Colors.transparent, //
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
            isDense: true,
            isCollapsed: true,
            contentPadding: EdgeInsets.zero,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: APPColors.hintText),
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _lineColor, width: 0.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _lineColor, width: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}
