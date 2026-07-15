import 'package:flutter/widgets.dart';
import 'package:flutter_odoo/features/customers/invoices/controller/controller.dart';
import 'package:flutter_odoo/features/customers/invoices/model/invoice_entry.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/customer_model.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/journal_model.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/payment_terms.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/taxes_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/model/acount_model.dart';
import 'package:get/get.dart';

//So every row gets its own controllers.No controller is shared.
class InvoiceLine {
  // InvoiceLine() {
  //   labelController = TextEditingController();
  //   priceController = TextEditingController();
  //   amountController = TextEditingController();
  // }

  final labelController = TextEditingController();
  final priceController = TextEditingController();
  final amountController = TextEditingController();

  AccountModel? account;
  TaxModel? tax;
  String label = '';
  double price = 0;
  double amount = 0;


void dispose() {
  labelController.dispose();
  priceController.dispose();
  amountController.dispose();
}
}

class CreateInvoiceController extends GetxController {
   late final InvoiceEntriesController entriesController;

  @override
  void onInit() {
    super.onInit();
    entriesController = Get.find<InvoiceEntriesController>();
  }


  final invController = TextEditingController();
  final invoiceDatecontroller = TextEditingController();
  final dueDatecontroller = TextEditingController();
  final paymentTermsController = TextEditingController();

  Rxn<DateTime> selectInvoiceDate = Rxn<DateTime>();
  Rxn<DateTime> selectDueDate = Rxn<DateTime>();
  Rxn<CustomerModel> selectCustomer = Rxn<CustomerModel>();
  Rxn<JournalModel> selectJournal = Rxn<JournalModel>();
  Rxn<PaymentTerms> selectPaymentTerms = Rxn<PaymentTerms>();

  List<CustomerModel> customer = [
    CustomerModel(id: 1, name: "Dawood"),
    CustomerModel(id: 2, name: "Rashid"),
    CustomerModel(id: 3, name: "Sharukh"),
  ];

  List<PaymentTerms> paymentTerms = [
    PaymentTerms(id: 1, name: "immediate"),
    PaymentTerms(id: 2, name: "15 days"),
    PaymentTerms(id: 3, name: "30 days"),
  ];

  List<JournalModel> journal = [
    JournalModel(id: 1, name: "Sales"),
    JournalModel(id: 2, name: "Service"),
    JournalModel(id: 3, name: "Product"),
  ];

  //account
  final accountModel = <AccountModel>[
    AccountModel(id: 0, name: "miscellenius operation"),
    AccountModel(id: 0, name: "tax returns"),
    AccountModel(id: 0, name: "cash basic taxes"),
    AccountModel(id: 0, name: "exchange difference"),
    AccountModel(id: 0, name: "add more ..."),
  ];

  final taxModel = <TaxModel>[
    TaxModel(id: 0, name: "Non Current Assets"),
    TaxModel(id: 1, name: "Tools Equipment"),
    TaxModel(id: 2, name: "Non Current Asset/Land"),
  ];

  void customerChoose(CustomerModel customer) {
    selectCustomer.value = customer;
  }

  void paymentCondition(PaymentTerms terms) {
    selectPaymentTerms.value = terms;
  }

  void journalChoose(JournalModel journal) {
    selectJournal.value = journal;
  }

  void selectInvoicDate(DateTime? date) {
    if (date == null) return;
    selectInvoiceDate.value = date;
    invoiceDatecontroller.text = _formatDate(date);
  }

  void selectDuDate(DateTime? date) {
    if (date == null) return;
    selectDueDate.value = date;
    dueDatecontroller.text = _formatDate(date);
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  //-----------------------------------------------------------------------------------------------

  // INVOICE HEADER LABLES
  final invoiceHeaderLabels = ["Label", "Account", "Price", "Tax", "Amount"];

  final lines = <InvoiceLine>[].obs;

  // add new row lines
  void addLine() {
    lines.add(InvoiceLine());
  }

  void updateAccount(int index, AccountModel value) {
    lines[index].account = value;
    lines.refresh();
  }

  void updateTaxes(int index, TaxModel value) {
    lines[index].tax = value;
    lines.refresh();
  }

  void updateLabel(int index, String value) {
    lines[index].label = value;
    lines.refresh();
  }

  void updatePrice(int index, String value) {
    lines[index].price = double.tryParse(value) ?? 0;
    lines.refresh();
  }

  void updateAmount(int index, String value) {
    lines[index].amount = double.tryParse(value) ?? 0;
    lines.refresh();
  }



  //---------------------------------------------------------

void postEntry() {
  final taxName = lines.isNotEmpty
      ? (lines.first.tax?.name ?? '')
      : '';

  final totalAmount = lines.fold(0.0, (sum, line) => sum + line.amount);

  entriesController.addEntry(
    InvoiceEntry(
      number: invController.text,
      customer: selectCustomer.value?.name ?? '',
      invoiceDate: selectInvoiceDate.value != null
          ? _formatDate(selectInvoiceDate.value!)
          : '',
      dueDate: selectDueDate.value != null
          ? _formatDate(selectDueDate.value!)
          : '',
      tax: taxName,
      total: totalAmount,
      amount: totalAmount.toStringAsFixed(2), // adjust if "amount" means something different
    ),
  );
}
   
}
