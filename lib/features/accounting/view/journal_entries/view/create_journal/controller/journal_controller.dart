import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/model/journal_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/acount_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/partner_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/tax_grid_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class JournalLine {
  AccountModel? account;
  PartnerModel? partner;
  String label = '';
  double debit = 0;
  double credit = 0;
  TaxGridModel? taxGrids;
}

class CreateJournalEntriesController extends GetxController {
  

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
 
    final  journalModel = <JournalModel> [
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
  final headerLabels = ["Account", "Partner", "Label", "Debit", "Credit", "Tax Grids"];

  

  void selectJournal(JournalModel journal) {
    selectedJournal.value = journal;
  }

   void addLine() {
    lines.add(JournalLine()); 
  }

   void removeLine(int index) {
    lines.removeAt(index); // ✅ same — automatic notification
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
}
