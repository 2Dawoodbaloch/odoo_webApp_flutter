import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/customer_model.dart';
import 'package:flutter_odoo/utils/constants/enum.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController {

  final Rx<PaymentType> selectedType = PaymentType.send.obs; 

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
}
