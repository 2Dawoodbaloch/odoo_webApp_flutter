import 'package:flutter/material.dart';

class GeneralLedgerTotalRow extends StatelessWidget {
  const GeneralLedgerTotalRow({super.key});

  static const List<String> _columns = ["Date", "Partner", "Debit", "Credit", "Balance"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column headers, right-aligned to match the screenshot
          Row(
            children: [
              const Expanded(flex: 3, child: SizedBox()), // empty space above "Total General Ledger" label
              for (final label in _columns)
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
          const SizedBox(height: 8),

          // The totals row itself
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Total General Ledger",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const Expanded(child: SizedBox()), // Date — empty for the total row
              const Expanded(child: SizedBox()), // Partner — empty for the total row
              Expanded(
                child: Text(
                  "0.00 Rs.",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              Expanded(
                child: Text(
                  "0.00 Rs.",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              Expanded(
                child: Text(
                  "0.00 Rs.",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}