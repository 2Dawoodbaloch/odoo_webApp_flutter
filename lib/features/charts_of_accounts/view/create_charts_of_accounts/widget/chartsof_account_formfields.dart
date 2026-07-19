import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/comm/widgets/help_tool_tip.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/controller/create_chart_Of_accounts_controller.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/model/account_type.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/model/default_taxes.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/model/parent_account.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/model/tags.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/widget/labeled_checkbox_field.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/widget/labeled_switch_field.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/taxes_model.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:get/get.dart';

class ChartsOfAccountsFormFields extends StatelessWidget {
  ChartsOfAccountsFormFields({super.key});
  final controller = Get.find<CreateChartOfAccountsController>();
  final double lableWidth = 130;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.bigContainer,
      decoration: BoxDecoration(
        color: APPColors.contentBackgroundColor,
        border: Border.all(color: APPColors.contentBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Enter code + create account
          CodeAccount(lableWidth: lableWidth, controller: controller),
          SizedBox(height: AppSpacing.md),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Accounting",
                      fontWeight: FontWeight.bold,
                      color: APPColors.btnPurple,
                      fontSize: AppTextSize.bodyDesktop,
                    ),
                    Divider(),
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          SizedBox(height: AppSpacing.sm),

          Row(
            children: [
              // left section
              Expanded(
                child: Column(
                  children: [
                    // acount type
                    Row(
                      children: [
                        TextWidget(
                          text: "Type",
                          labelWidth: lableWidth,
                          fontWeight: FontWeight.bold,
                          tooltip: "choose any account",
                        ),
                        Expanded(
                          child: SearchableDropdownField<AccountTypeModel>(
                            items: controller.accountType,
                            labelBuilder: (m) => m.name,
                            isTable: true, // to make bottom line dispear
                            selectedItem: controller.selectType.value,
                            onSelected: (value) =>
                                controller.selectAccount(value),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    // defalut tax
                    Row(
                      children: [
                        TextWidget(
                          text: "Default TAX",
                          labelWidth: lableWidth,
                          fontWeight: FontWeight.bold,
                          tooltip: "choose TAX",
                        ),
                        Expanded(
                          child: SearchableDropdownField<TaxModel>(
                            items: controller.taxes,
                            labelBuilder: (m) => m.name,
                            isTable: true,
                            selectedItem: controller.selectTax.value,
                            onSelected: (value) => controller.taxChoose(value),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    // tags
                    Row(
                      children: [
                        TextWidget(
                          text: "Tags",
                          labelWidth: lableWidth,
                          fontWeight: FontWeight.bold,
                          tooltip: "choose any tags",
                        ),
                        Expanded(
                          child: SearchableDropdownField<TagsModel>(
                            items: controller.tags,
                            labelBuilder: (m) => m.name,
                            isTable: true,
                            selectedItem: controller.selecttags.value,
                            onSelected: (value) => controller.chooseTag(value),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSpacing.spaceBtwRwCl),
              // right section
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => LabeledCheckboxField(
                        label: "Payment Reconciliation",
                        value: controller.paymentReconciliation.value,
                        showHelpIcon: true,
                        onChanged: (value) =>
                            controller.paymentReconciliation.value = value,
                      ),
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    Row(
                      children: [
                        TextWidget(text: "Active", labelWidth: 130,fontWeight: FontWeight.bold,),
                        Obx(
                          () => CustomSwitch(
                            scale: 0.65,
                            value: controller.isActive.value,
                            onChanged: (value) =>
                                controller.isActive.value = value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    Row(
                      children: [
                        TextWidget(
                          text: "Parent Account",
                          labelWidth: lableWidth,
                          fontWeight: FontWeight.bold,
                          tooltip: "choose any account",
                        ),
                        Expanded(
                          child: SearchableDropdownField<ParentAccountModel>(
                            items: controller.parentAccount,
                            labelBuilder: (m) => m.name,
                            isTable: true,
                            selectedItem: controller.selectParentAccount.value,
                            onSelected: (value) =>
                                controller.selectParentAcc(value),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.lg),

          // desctiption
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Description",
                      fontWeight: FontWeight.bold,
                      color: APPColors.btnPurple,
                    ),
                    Divider(),
                    SizedBox(height: AppSpacing.lg),
                    CustomFormField(
                      hint: "write descriptin here Description",
                      controller: controller.descController,
                      enableBorder: true,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          // description
        ],
      ),
    );
  }
}

class CodeAccount extends StatelessWidget {
  const CodeAccount({
    super.key,
    required this.lableWidth,
    required this.controller,
  });

  final double lableWidth;
  final CreateChartOfAccountsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(labelWidth: lableWidth, text: "Code"),
              SizedBox(height: AppSpacing.sm),
              CustomFormField(
                enableBorder: false,
                controller: controller.codeController,
              ),
            ],
          ),
        ),
        SizedBox(width: AppSpacing.spaceBtwRwCl),
        Expanded(
          // ✅ gives the "Account Name" Row a bounded width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(labelWidth: lableWidth, text: "Account Name"),
              SizedBox(height: AppSpacing.sm),
              CustomFormField(
                enableBorder: false,
                hint: "Current Address",
                controller: controller.accountNameController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
