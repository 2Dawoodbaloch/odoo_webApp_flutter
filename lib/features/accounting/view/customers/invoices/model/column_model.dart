import 'package:flutter/material.dart';

class InvoiceHeaderModel {
  const InvoiceHeaderModel({
    required this.label,
    this.flex = 1,
    this.alignment = Alignment.centerLeft,
    this.sortable = false,
  });

  final String label;
  final int flex;
  final Alignment alignment;
  final bool sortable;
}