import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/charts_of_accounts/controller/chartsof_account_controller.dart';
import 'package:flutter_odoo/features/charts_of_accounts/model/charts_of_account_model.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/model/account_type.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/model/parent_account.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/model/tags.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/taxes_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CreateChartOfAccountsController extends GetxController {
  final codeController = TextEditingController();
  final accountNameController = TextEditingController();
  final descController = TextEditingController();

  // in AddPaymentController
final RxBool paymentReconciliation = false.obs;
final RxBool isActive = true.obs;

  // Account type
  List<AccountTypeModel> accountType = [
    AccountTypeModel(id: 1, name: "Assets"),
    AccountTypeModel(id: 2, name: "Equity"),
    AccountTypeModel(id: 3, name: "Liabilities"),
    AccountTypeModel(id: 3, name: "Expenses"),
    AccountTypeModel(id: 3, name: "Profit"),
    AccountTypeModel(id: 3, name: "Loss"),
  ];
  Rxn<AccountTypeModel> selectType = Rxn<AccountTypeModel>();

  void selectAccount(AccountTypeModel type) {
    selectType.value = type;
  }

  // tax
  List<TaxModel> taxes = [
    TaxModel(id: 1, name: "17%"),
    TaxModel(id: 2, name: "19%"),
    TaxModel(id: 3, name: "30%"),
  ];
  Rxn<TaxModel> selectTax = Rxn<TaxModel>();

  void taxChoose(TaxModel tax) {
    selectTax.value = tax;
  }

  // parent account
  List<ParentAccountModel> parentAccount = [
    ParentAccountModel(id: 1, name: "111 Asets / non current assets"),
    ParentAccountModel(id: 2, name: "111 Asets / non current assets/ property"),
    ParentAccountModel(
      id: 3,
      name: "111 Asets / non current assets/hostel bank",
    ),
  ];
  Rxn<ParentAccountModel> selectParentAccount = Rxn<ParentAccountModel>();

  void selectParentAcc(ParentAccountModel account) {
    selectParentAccount.value = account;
  }

  // tags
  List<TagsModel> tags = [
    TagsModel(id: 1, name: "operating activities"),
    TagsModel(id: 2, name: "financing activities"),
    TagsModel(id: 3, name: "other"),
  ];
  Rxn<TagsModel> selecttags = Rxn<TagsModel>();

  void chooseTag(TagsModel tag) {
    selecttags.value = tag;
  }


  late final ChartOfAccountsController accountsController;

@override
void onInit() {
  super.onInit();
  accountsController = Get.find<ChartOfAccountsController>();
}

void postAccount() {
  accountsController.addAccount(
    ChartsOfAccountModel(
      code: codeController.text,
      name: accountNameController.text,
      type: selectType.value?.name ?? "",
      paymentReconciliation: paymentReconciliation.value,
    ),
  );
}
}
