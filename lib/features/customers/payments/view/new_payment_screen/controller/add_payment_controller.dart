import 'package:flutter/widgets.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/customer_model.dart';
import 'package:flutter_odoo/features/customers/payments/controller/payment_controller.dart';
import 'package:flutter_odoo/features/customers/payments/model/payment_model.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/model/company_bank.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/model/journal_model.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/model/payment_method.dart';
import 'package:flutter_odoo/utils/constants/enum.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController {
  final amountController = TextEditingController();
  final memo = TextEditingController();
  final dateController = TextEditingController();

  final Rx<PaymentType> selectedType = PaymentType.send.obs;
  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  List<PaymentMethod> paymentMethod = [
    PaymentMethod(id: 1, name: "upaisa"),
    PaymentMethod(id: 1, name: "upaisa"),
    PaymentMethod(id: 1, name: "upaisa"),
  ];

  List<CompanyBank> compnayBank = [
    CompanyBank(id: 1, name: "hbl"),
    CompanyBank(id: 1, name: "hbl"),
    CompanyBank(id: 1, name: "hbl"),
  ];

  List<JournalModel> journal = [
    JournalModel(id: 1, name: "Sales"),
    JournalModel(id: 2, name: "Service"),
    JournalModel(id: 3, name: "Product"),
  ];
  Rxn<PaymentMethod> selectedPaymentMethod = Rxn<PaymentMethod>();
  Rxn<JournalModel> selectedJournal = Rxn<JournalModel>();
  Rxn<CompanyBank> selectedBank = Rxn<CompanyBank>();

  void selectPaymentMethod(PaymentMethod method) {
    selectedPaymentMethod.value = method;
  }

  void selectJournal(JournalModel journal) {
    selectedJournal.value = journal;
  }

  void selectCompanyBank(CompanyBank bank) {
    selectedBank.value = bank;
  }

  void selectDate(DateTime? date) {
    if (date == null) return;
    selectedDate.value = date;
    dateController.text = _formatDate(date);
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  void setPaymentType(PaymentType type) {
    selectedType.value = type;
  }

  List<CustomerModel> customer = [
    CustomerModel(id: 1, name: "Dawood"),
    CustomerModel(id: 2, name: "Rashid"),
    CustomerModel(id: 3, name: "Sharukh"),
  ];
  Rxn<CustomerModel> selectCustomer = Rxn<CustomerModel>();

  void customerChoose(CustomerModel customer) {
    selectCustomer.value = customer;
  }

  late final PaymentController paymentsController;

  @override
  void onInit() {
    super.onInit();
    paymentsController = Get.find<PaymentController>();
  }

  void postPayment() {
    paymentsController.addPayment(
      PaymentModel(
        date: selectedDate.value ?? DateTime.now(),
        number:
            null, // stays null/draft until actually confirmed, matches your screenshot's Draft rows
        journal: selectedJournal.value?.name ?? "",
        customer: selectCustomer.value?.name ?? "",
        amount: double.tryParse(amountController.text) ?? 0,
        status: "Draft",
      ),
    );
  }
}
