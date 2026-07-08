import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/label_divider.dart';
import 'package:flutter_odoo/comm/widgets/navbar/custom_navbar.dart';
import 'package:flutter_odoo/features/accounting/screens/accounting/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/features/accounting/screens/accounting/widgets/dash_board_card.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';

enum MenuOptions { profile, settings, logout }

class AccountingHomeScreen extends StatefulWidget {
  const AccountingHomeScreen({super.key});

  @override
  State<AccountingHomeScreen> createState() => _AccountingHomeScreenState();
}

class _AccountingHomeScreenState extends State<AccountingHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isDesktop = width >= ScreenBreakPoints.desktop;
        final isTablet =
            width >= ScreenBreakPoints.mobile &&
            width < ScreenBreakPoints.desktop;

        if (isDesktop) {
          return _desktopLayout();
        } else if (isTablet) {
          return _tabletLayout();
        }

        return _mobileLayout();
      },
    );
  }

  // Desktop Layout
  Widget _desktopLayout() {
    return Scaffold(
      backgroundColor: APPColors.white,

      //navigation
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // ACCOUNTING NAVBAR
              AccountingNavBar(context: context),
              SizedBox(height: AppSpacing.md),
              // NAVBAR
              CustomNavBar(),
              SizedBox(height: AppSpacing.sm),
              Divider(),
              SizedBox(height: AppSpacing.lg),

              // Card Screen

              // Row first
              Padding(
                padding: AppSpacing.horizontalPadding,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: "Sales",
                            description:
                                "Get Paid online. Send electronic invoices.",

                            button: CustomButton(
                              title: "New",
                              backgroundColor: APPColors.btnPurple,
                              textColor: APPColors.white,
                            ),
                            body: Center(
                              child: Image.asset(
                                height: 100,
                                "assets/images/chart.png",
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: DashboardCard(
                            title: "Purchases",
                            description:
                                "Let Artificial Intelligence scan your bill. Pay easily",
                            button: CustomButton(
                              title: "Upload",
                              backgroundColor: APPColors.btnPurple,
                              textColor: APPColors.white,
                            ),
                            body: Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/gemini.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: AppSpacing.md),
                                      CustomButton(
                                        title: "upload",
                                        backgroundColor: APPColors.btnPurple,
                                        textColor: APPColors.white,
                                      ),
                                    ],
                                  ),

                                  LabeledDivider(label: "OR", isVertical: true),

                                  Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/message.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: AppSpacing.md),
                                      TextWidget(
                                        text: "Create a bill manually",
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),

                    // 2nd Row
                    // 2nd Row
                    Row(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: "Sales",
                            description:
                                "Get Paid online. Send electronic invoices.",

                            button: CustomButton(
                              title: "New",
                              backgroundColor: APPColors.btnPurple,
                              textColor: APPColors.white,
                            ),
                            body: Center(child: Text("Search Over 600 Banks")),
                          ),
                        ),
                        SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: DashboardCard(
                            title: "Tax Return",
                            description: "let we help you in tax return",
                            button: CustomButton(
                              title: "Tex Return",
                              backgroundColor: APPColors.btnPurple,
                              textColor: APPColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),
                    // 3rd Row
                    Row(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: "Salaries",
                            description: "let we help you in tax return",
                            button: CustomButton(
                              title: "Tex Return",
                              backgroundColor: APPColors.btnPurple,
                              textColor: APPColors.white,
                            ),
                          ),
                        ),

                        Expanded(child: Container()),
                      ],
                    ),
                  ],
                ),
              ),
            ], // 2nd Row
          ),
        ),
      ),
    );
  }

  // TABLET LAYOUT
  Widget _tabletLayout() {
    return Column(children: []);
  }

  // MOBILE LAYOUT
  Widget _mobileLayout() {
    return Column(children: []);
  }
}
