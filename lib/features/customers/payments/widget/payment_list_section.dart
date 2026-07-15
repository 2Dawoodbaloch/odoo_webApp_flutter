import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/status_badge.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/empty_state_view.dart';
import 'package:flutter_odoo/features/customers/payments/controller/payment_controller.dart';
import 'package:get/get.dart';

class PaymentListSection extends StatelessWidget {
  const PaymentListSection({super.key});

   final headerLabels = const ["Date", "Number", "Journal", "Customer", "Amount", "State"];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PaymentController>();

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
            if (controller.paymentsEntries.isEmpty) {
              return const EmptyStateView(
                title: "No Payment entries yet",
                description: "Create a Payment entry to see it listed here.",
              );
            }
            return ListView.builder(
              itemCount: controller.paymentsEntries.length,
              itemBuilder: (context, index) {
                final entry = controller.paymentsEntries[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                      Expanded(
                        child: Text(
                          "${(entry.date.month)} ${entry.date.day}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Text(entry.number ?? "", style: TextStyle(color: Colors.yellow)),
                      ),
                      Expanded(
                        child: Text(entry.journal, style: TextStyle(color: Colors.green)),
                      ),
                      Expanded(
                        child: Text(entry.customer, style: TextStyle(color: Colors.black)),
                      ),
                      Expanded(
               
                        child: Text(
                          "${entry.amount.toStringAsFixed(2)} Rs.",
                        
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    
                      Expanded(
                
                        child: StatusBadge(status: entry.status),
                      ),
                     
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