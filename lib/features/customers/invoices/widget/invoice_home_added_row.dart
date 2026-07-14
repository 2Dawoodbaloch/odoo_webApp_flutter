import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/controller/controller.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/empty_state_view.dart';
import 'package:get/get.dart';

class InvoiceHomeAddedRow extends StatelessWidget {
  const InvoiceHomeAddedRow({super.key});

   final headerLabels = const ["Number", "Customer", "Invoice Date", "Due Date", "Tax", "Total", "Amount"];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InvoiceEntriesController>();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 40), // checkbox space
              for (final label in headerLabels)
                Expanded(
                  child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
            ],
          ),
        ),

        // Rows — reactive to the shared controller
        Expanded(
          child: Obx(() {
            if (controller.entries.isEmpty) {
              return const EmptyStateView(
                title: "No journal entries yet",
                description: "Create a journal entry to see it listed here.",
              );
            }
            return ListView.builder(
              itemCount: controller.entries.length,
              itemBuilder: (context, index) {
                final entry = controller.entries[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                       Expanded(child: Text(entry.number)),       // ✅ matches "Number"
                      Expanded(child: Text(entry.customer)),     // ✅ matches "Customer"
                      Expanded(child: Text(entry.invoiceDate)),  // ✅ matches "Invoice Date"
                      Expanded(child: Text(entry.dueDate)),      // ✅ matches "Due Date"
                      Expanded(child: Text(entry.tax)),          // ✅ matches "Tax"
                      Expanded(child: Text("${entry.total} Rs.")), // ✅ matches "Total", fixed interpolation
                      Expanded(child: Text(entry.amount)),       // ✅ matches "Amount"
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}