import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/controller/journal_controller.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/acount_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/partner_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/tax_grid_model.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:get/get.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';

class JournalLinesTable extends StatelessWidget {
  const JournalLinesTable({super.key});

  static const Map<int, TableColumnWidth> _columnWidths = {
    0: FlexColumnWidth(3),
    1: FlexColumnWidth(2),
    2: FlexColumnWidth(3),
    3: FlexColumnWidth(1),
    4: FlexColumnWidth(1),
    5: FlexColumnWidth(1),
  };

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateJournalEntriesController>(); // ✅ borrow the controller

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return Table(
            columnWidths: _columnWidths,
            border: TableBorder(
              top: BorderSide(color: Colors.grey.shade300, width: 1),
              bottom: BorderSide(color: Colors.grey.shade300, width: 1),
              horizontalInside: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            children: [
              _buildHeaderRow(controller.headerLabels),
              for (int i = 0; i < controller.lines.length; i++)
                _buildDataRow(controller, i),
            ],
          );
        }),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: controller.addLine, 
            child: const Text(
              "Add a line",
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildHeaderRow(List<String> headerLabels) {
    return TableRow(
      children: [
        for (final label in headerLabels)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ),
      ],
    );
  }

  TableRow _buildDataRow(CreateJournalEntriesController controller, int i) {
    const cellPadding = EdgeInsets.symmetric(horizontal: 4, vertical: 12);
    final line = controller.lines[i];

    return TableRow(
      children: [
        Padding(
          padding: cellPadding,
          child: SearchableDropdownField<AccountModel>(
            items: controller.accountModel,
            labelBuilder: (a) => a.name,
            hintText: "account",
            isTable: true,
            selectedItem: line.account,
            onSelected: (value) => controller.updateAccount(i, value),
          ),
        ),
        Padding(
          padding: cellPadding,
          child: SearchableDropdownField<PartnerModel>(
            items: controller.partnerModel,
            labelBuilder: (a) => a.name,
            hintText: "partner",
            isTable: true,
            selectedItem: line.partner,
            onSelected: (value) => controller.updatePartner(i, value),
          ),
        ),
        Padding(
          padding: cellPadding,
          child: CustomFormField(
            isTable: true,
            onChanged: (value) => controller.updateLabel(i, value),
          ),
        ),
        Padding(
          padding: cellPadding,
          child: CustomFormField(
            isTable: true,
            hint: "0.00",
            onChanged: (value) => controller.updateDebit(i, value),
          ),
        ),
        Padding(
          padding: cellPadding,
          child: CustomFormField(
            isTable: true,
            hint: "0.00",
            onChanged: (value) => controller.updateCredit(i, value),
          ),
        ),
        Padding(
          padding: cellPadding,
          child: SearchableDropdownField<TaxGridModel>(
            items: controller.taxGridModel,
            labelBuilder: (a) => a.name,
            hintText: "tax grid",
            isTable: true,
            selectedItem: line.taxGrids,
            onSelected: (value) => controller.updateTaxGrid(i, value),
          ),
        ),
      ],
    );
  }
}