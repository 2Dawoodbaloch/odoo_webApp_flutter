import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/empty_state_view.dart';
import 'package:flutter_odoo/features/charts_of_accounts/controller/chartsof_account_controller.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:get/get.dart';

class ChartsListSection extends StatelessWidget {
  const ChartsListSection({super.key});

  final headerLabels = const [
    "Code",
    "Account Name",
    "Type",
    "Payment Reconcillation",
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChartOfAccountsController>();

    return Column(
      children: [
        Container(
          padding: AppSpacing.listTableRowPadding,
          decoration: BoxDecoration(
            border: Border.all(color: APPColors.contentBorderColor),
          ),
          child: Row(
            children: [
              const SizedBox(width: 40), // checkbox space
              for (final label in headerLabels)
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
            ],
          ),
        ),

        // Rows — reactive to the shared controller
        Expanded(
          child: Obx(() {
            if (controller.accountEntries.isEmpty) {
              return const EmptyStateView(
                title: "No accounts yet",
                description: "Add an account to see it listed here.",
              );
            }
            return ListView.builder(
              itemCount: controller.accountEntries.length,
              itemBuilder: (context, index) {
                final entry = controller.accountEntries[index];
                return Container(
                  padding: AppSpacing.listTableRowPadding,
                  // color: APPColors.contentBackgroundColor,
                  decoration: BoxDecoration(
                    color: APPColors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                      Expanded(child: Text(entry.code)),
                      Expanded(child: Text(entry.name)),
                      Expanded(child: Text(entry.type)),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Transform.scale(
                            scale: 0.8, // ✅ shrinks the visual switch slightly
                            child: Switch(
                              value: entry.paymentReconciliation,
                              onChanged: (value) =>
                                  controller.toggleReconciliation(index, value),
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green.shade600,
                              materialTapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap, // ✅ you already had this
                            ),
                          ),
                        ),
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
