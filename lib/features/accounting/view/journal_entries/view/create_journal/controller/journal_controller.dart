import 'package:flutter/widgets.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/journal_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/controller/journal_entries_controller.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/acount_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/partner_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/tax_grid_model.dart';
import 'package:get/get.dart';

class JournalLine {
  JournalLine() {
    labelController = TextEditingController();
    debitController = TextEditingController();
    creditController = TextEditingController();
  }

  AccountModel? account;
  PartnerModel? partner;
  String label = '';
  double debit = 0;
  double credit = 0;
  TaxGridModel? taxGrids;

  late final TextEditingController labelController;
  late final TextEditingController debitController;
  late final TextEditingController creditController;

  void dispose() {
    // ✅ add this
    labelController.dispose();
    debitController.dispose();
    creditController.dispose();
  }
}

class CreateJournalEntriesController extends GetxController {
 late final JournalEntriesController entriesController;

  @override
  void onInit() {
    super.onInit();
    entriesController = Get.find<JournalEntriesController>();
  }


  void postEntry() {
    final partnerName = lines.isNotEmpty
        ? (lines.first.partner?.name ?? '')
        : '';
    entriesController.addEntry(
      JournalEntry(
        date: accountingDate.value ?? DateTime.now(),
        number: miscController.text,
        partner: partnerName,
        reference: referenceController.text,
        journal: selectedJournal.value?.name ?? "",
        total: lines.fold(0.0, (sum, line) => sum + line.debit),
        status: "Posted",
      ),
    );
  }

  final miscController = TextEditingController();
  final referenceController = TextEditingController();

  Rxn<DateTime> accountingDate = Rxn<DateTime>();
  final accountingDateController = TextEditingController();

  void selectAccountingDate(DateTime date) {
    accountingDate.value = date;
    accountingDateController.text = _formatDate(date);
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  final journals = <JournalModel>[
    JournalModel(id: 0, name: "miscellenius operation"),
    JournalModel(id: 0, name: "tax returns"),
    JournalModel(id: 0, name: "cash basic taxes"),
    JournalModel(id: 0, name: "exchange difference"),
    JournalModel(id: 0, name: "add more ..."),
  ];

  final accountModel = <AccountModel>[
    AccountModel(id: 0, name: "Non Current Assets"),
    AccountModel(id: 1, name: "Tools Equipment"),
    AccountModel(id: 2, name: "Non Current Asset/Land"),
  ];

  final partnerModel = <PartnerModel>[
    PartnerModel(id: 0, name: "Dawood"),
    PartnerModel(id: 1, name: "Rahim"),
    PartnerModel(id: 2, name: "Awais"),
  ];

  final journalModel = <JournalModel>[
    JournalModel(id: 0, name: "miscellinous operation"),
    JournalModel(id: 1, name: "Cash Basics Taxes"),
    JournalModel(id: 2, name: "Exchange Difference"),
  ];

  final taxGridModel = <TaxGridModel>[
    TaxGridModel(id: 0, name: "17% Gst"),
    TaxGridModel(id: 0, name: "17% Gst"),
    TaxGridModel(id: 0, name: "17% Gst"),
  ];

  Rxn<JournalModel> selectedJournal = Rxn<JournalModel>();

  final lines = <JournalLine>[].obs;
  
  final headerLabels = [
    "Account",
    "Partner",
    "Label",
    "Debit",
    "Credit",
    "Tax Grids",
  ];

  void selectJournal(JournalModel journal) {
    selectedJournal.value = journal;
  }

  void addLine() {
    lines.add(JournalLine());
  }

  void removeLine(int index) {
    lines[index].dispose();
    lines.removeAt(index);
  }

  void updateAccount(int index, AccountModel value) {
    lines[index].account = value;
    lines.refresh();
  }

  void updatePartner(int index, PartnerModel value) {
    lines[index].partner = value;
    lines.refresh();
  }

  void updateLabel(int index, String value) {
    lines[index].label = value;
    lines.refresh();
  }

  void updateDebit(int index, String value) {
    lines[index].debit = double.tryParse(value) ?? 0;
    lines.refresh();
  }

  void updateCredit(int index, String value) {
    lines[index].credit = double.tryParse(value) ?? 0;
    lines.refresh();
  }

  void updateTaxGrid(int index, TaxGridModel value) {
    lines[index].taxGrids = value;
    lines.refresh();
  }

  @override
  void onClose() {
    for (final line in lines) {
      line.dispose();
    }
    super.onClose();
  }
}
