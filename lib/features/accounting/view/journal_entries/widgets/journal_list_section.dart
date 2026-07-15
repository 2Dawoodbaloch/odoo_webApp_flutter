import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/controller/journal_entries_controller.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/empty_state_view.dart';
import 'package:get/get.dart';

class JournalListSection extends StatelessWidget {
  const JournalListSection({super.key});

  final headerLabels = const ["Date", "Number", "Partner", "Reference", "Journal", "Total", "Status"];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JournalEntriesController>();

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
                      Expanded(child: Text("${entry.date.month}/${entry.date.day}")),
                      Expanded(child: Text(entry.number)),
                      Expanded(child: Text(entry.partner)),
                      Expanded(child: Text(entry.reference)),
                      Expanded(child: Text(entry.journal)),
                      Expanded(child: Text("${entry.total.toStringAsFixed(2)} Rs.")),
                      Expanded(child: Text(entry.status)),
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