import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/comm/widgets/tab_section.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/model/journal_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/controller/journal_controller.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/widget/journal_line_table.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:get/get.dart';

class AddInfoJournalEntries extends StatefulWidget {
  const AddInfoJournalEntries({super.key});

  @override
  State<AddInfoJournalEntries> createState() => _AddInfoJournalEntriesState();
}

class _AddInfoJournalEntriesState extends State<AddInfoJournalEntries> {
  final controller = Get.find<CreateJournalEntriesController>();

  @override
  Widget build(BuildContext context) {
    print("--------------------i am build");
    return Container(
      width: double.infinity,
      padding: AppSpacing.bigContainer,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFormField(
            hint: "MISC/2026/000007",
            fontSize: AppTextSize.hinText,
          ),
          SizedBox(height: AppSpacing.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // left section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextWidget(text: "Reference", labelWidth: 130),
                        Expanded(child: CustomFormField(enableBorder: true)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSpacing.md),
              // right section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextWidget(text: "Accounting Date", labelWidth: 130),
                        Expanded(child: CustomFormField(hint: "19/10/2026")),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),

                    Row(
                      children: [
                        TextWidget(text: "Jounal", labelWidth: 130),

                        Expanded(
                          child: Obx(() {
                            return SearchableDropdownField<JournalModel>(
                              items: controller.journalModel,
                              labelBuilder: (a) => a.name,
                              selectedItem: controller.selectedJournal.value,
                              onSelected: controller
                                  .selectJournal, // ✅ points directly at the controller method
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.lg),

          // tab section
          TabsSection(
            tabs: [
              TabItem(label: "Journal Items", content: JournalLinesTable()),
              TabItem(
                label: "Other Info",
                content: Center(child: Text("Nothing")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
