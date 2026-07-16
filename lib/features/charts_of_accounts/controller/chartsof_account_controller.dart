import 'package:flutter_odoo/features/charts_of_accounts/model/charts_of_account_model.dart';
import 'package:get/get.dart';

class ChartOfAccountsController extends GetxController {
  final accountEntries = <ChartsOfAccountModel>[].obs;

  void addAccount(ChartsOfAccountModel account) {
    accountEntries.add(account);
  }

  void toggleReconciliation(int index, bool value) {
    final old = accountEntries[index];
    accountEntries[index] = ChartsOfAccountModel(
      code: old.code,
      name: old.name,
      type: old.type,
      paymentReconciliation: value,
    );
    accountEntries.refresh(); // needed since we replaced an item, not just mutated a field
  }
}