import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/date_form_field.dart';
import 'package:flutter_odoo/comm/widgets/help_tool_tip.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/model/country_model.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/enum.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/emergency_contact.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/employee_tabs/personal_location.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/private_contact.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/file_uploaded_field.dart';

class PersonalTabContent extends StatefulWidget {
  const PersonalTabContent({super.key});

  @override
  State<PersonalTabContent> createState() => _PersonalTabContentState();
}

class _PersonalTabContentState extends State<PersonalTabContent> {
  static const List<CountryModel> all = [
    CountryModel(
      name: "Pakistan",
      isoCode: "PK",
      dialCode: "+92",
      flagEmoji: "🇵🇰",
    ),
    CountryModel(
      name: "United States",
      isoCode: "US",
      dialCode: "+1",
      flagEmoji: "🇺🇸",
    ),
    CountryModel(
      name: "United Kingdom",
      isoCode: "GB",
      dialCode: "+44",
      flagEmoji: "🇬🇧",
    ),
    CountryModel(
      name: "India",
      isoCode: "IN",
      dialCode: "+91",
      flagEmoji: "🇮🇳",
    ),
    CountryModel(
      name: "Canada",
      isoCode: "CA",
      dialCode: "+1",
      flagEmoji: "🇨🇦",
    ),
    CountryModel(
      name: "Australia",
      isoCode: "AU",
      dialCode: "+61",
      flagEmoji: "🇦🇺",
    ),
    CountryModel(
      name: "Germany",
      isoCode: "DE",
      dialCode: "+49",
      flagEmoji: "🇩🇪",
    ),
    CountryModel(
      name: "United Arab Emirates",
      isoCode: "AE",
      dialCode: "+971",
      flagEmoji: "🇦🇪",
    ),
    CountryModel(
      name: "Saudi Arabia",
      isoCode: "SA",
      dialCode: "+966",
      flagEmoji: "🇸🇦",
    ),
    // ...extend as needed, or fetch full list from an API/JSON asset
  ];

  PlatformFile? idCardFile;
  PlatformFile? drivingLicenseFile;

  CountryModel? selectedCountry;
  Sex? selectedSex;
  DateTime? birthday;
  @override
  Widget build(BuildContext context) {
    const double labelWidth = 130;
    return Column(
      children: [
        // 1st Section Private Contact + Personal Information
        Row(
          crossAxisAlignment: CrossAxisAlignment.start, //
          children: [
            // privaate contact
            PrivateContact(labelWidth: labelWidth),
            const SizedBox(width: AppSpacing.md),

            // Personal Informatio // Right Section
            personalInformation(labelWidth),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // 2nd Section CitizenShip + Work Visa Permit
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // should i extract thier method or create stateless widget
            // citizenship
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CitizenShip",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(),
                  SizedBox(height: AppSpacing.lg),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(labelWidth: labelWidth, text: "Citizenship"),
                      SizedBox(width: AppSpacing.lg),

                      Expanded(
                        child: SearchableDropdownField<CountryModel>(
                          items: all,
                          labelBuilder: (country) => country.name,
                          onSelected: (value) =>
                              setState(() => selectedCountry = value),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      TextWidget(
                        text: "Identification",
                        labelWidth: labelWidth,
                      ),
                      const SizedBox(width: 4),
                      const HelpTooltip(
                        message: "identificaiton (passport, ID card, etc.)",
                      ),
                      Expanded(child: CustomFormField(enableBorder: false)),
                    ],
                  ),

                  Row(
                    children: [
                      TextWidget(text: "Passport", labelWidth: labelWidth),
                      const SizedBox(width: 4),

                      Expanded(child: CustomFormField(enableBorder: false)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.lg),

            // visa work and permit
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Visa & Work Permit",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: AppSpacing.lg),

                  Row(
                    children: [
                      TextWidget(text: "Visa No", labelWidth: labelWidth),
                      const SizedBox(width: 4),

                      Expanded(child: CustomFormField(enableBorder: true)),
                    ],
                  ),

                  Row(
                    children: [
                      TextWidget(text: "Work & Permit", labelWidth: labelWidth),
                      const SizedBox(width: 4),

                      Expanded(child: CustomFormField(enableBorder: false)),
                    ],
                  ),

                  Row(
                    children: [
                      TextWidget(text: "upload file", labelWidth: labelWidth),
                      const SizedBox(width: 4),

                      Expanded(child: CustomFormField(enableBorder: false)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // emergency + work location
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // emergency contact
            EmergencyContact(labelWidth: labelWidth),

            const SizedBox(width: AppSpacing.lg),
            // Location
            PersonalLocation(labelWidth: labelWidth),
          ],
        ),

        // family + education
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // family
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "family",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: AppSpacing.lg),

                  Row(
                    children: [
                      TextWidget(
                        text: "Martial Status",
                        labelWidth: labelWidth,
                      ),
                      const SizedBox(width: 4),

                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SearchableDropdownField<Sex>(
                              items: Sex
                                  .values, // ✅ built-in — every enum has `.values` automatically
                              labelBuilder: (sex) => sex.label,
                              onSelected: (value) =>
                                  setState(() => selectedSex = value),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  // dependent children
                  Row(
                    children: [
                      TextWidget(
                        text: "Dependent Children",
                        labelWidth: labelWidth,
                      ),
                      const SizedBox(width: 4),

                      Expanded(
                        child: CustomFormField(enableBorder: false, hint: "0"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: AppSpacing.lg),
            // education
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      TextWidget(
                        text: "Certificate level",
                        labelWidth: labelWidth,
                      ),
                      const SizedBox(width: 4),

                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SearchableDropdownField<Sex>(
                              items: Sex
                                  .values, // ✅ built-in — every enum has `.values` automatically
                              labelBuilder: (sex) => sex.label,
                              onSelected: (value) =>
                                  setState(() => selectedSex = value),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      TextWidget(
                        text: "Field of Study",
                        labelWidth: labelWidth,
                      ),
                      const SizedBox(width: 4),

                      Expanded(
                        child: CustomFormField(
                          enableBorder: false,
                          hint: "Math,Engineering...",
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

        // document section
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DOCUMENTS",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: AppSpacing.lg),

                  // id card copy
                  Row(
                    children: [
                      TextWidget(text: "ID Card Copy", labelWidth: labelWidth),
                      const SizedBox(width: 4),
                      Expanded(
                        child: FileUploadField(
                          hint: "Upload Your License",
                          icon: Icons.upload_file,
                          onFileSelected: (file) {
                            setState(() => idCardFile = file);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.lg),

                  // Driving License
                  Row(
                    children: [
                      TextWidget(
                        text: "Driving License",
                        labelWidth: labelWidth,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: FileUploadField(
                          hint: "Upload Your License",
                          icon: Icons.upload_file,
                          onFileSelected: (file) {
                            setState(() => drivingLicenseFile = file);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }

  Expanded personalInformation(double labelWidth) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PERSONAL INFORMATION",
            style: TextStyle(
              fontSize: AppTextSize.bodyDesktop,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          SizedBox(height: AppSpacing.lg),
          // legal name
          Row(
            children: [
              TextWidget(text: "Legal Name", labelWidth: labelWidth),
              const SizedBox(width: 4),
              const HelpTooltip(
                message:
                    "Use the name as it appears on official documents (passport, ID card, etc.)",
              ),
              Expanded(child: CustomFormField(enableBorder: false)),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          // birthday
          Row(
            children: [
              TextWidget(text: "Birthday", labelWidth: labelWidth),
              Expanded(
                child: DateFormField(
                  hint: "MM/DD/YYYY",
                  onDateSelected: (date) {
                    setState(() => birthday = date);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),

          // place of birth + country
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // place of birth
              Expanded(
                child: Row(
                  children: [
                    TextWidget(text: "Pace of birth", labelWidth: labelWidth),
                    const SizedBox(width: 4),

                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SearchableDropdownField<Sex>(
                            items: Sex
                                .values, // ✅ built-in — every enum has `.values` automatically
                            labelBuilder: (sex) => sex.label,
                            onSelected: (value) =>
                                setState(() => selectedSex = value),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // choose country
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(labelWidth: labelWidth, text: "Country"),
                    SizedBox(width: AppSpacing.lg),

                    // department
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SearchableDropdownField<CountryModel>(
                            items: all,
                            labelBuilder: (country) => country.name,
                            onSelected: (value) =>
                                setState(() => selectedCountry = value),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // sex
          Row(
            children: [
              TextWidget(text: "Sex", labelWidth: labelWidth),
              const SizedBox(width: 4),
              const HelpTooltip(
                message: "Choose ur gender (male, femal,trans etc.)",
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SearchableDropdownField<Sex>(
                      items: Sex
                          .values, // ✅ built-in — every enum has `.values` automatically
                      labelBuilder: (sex) => sex.label,
                      onSelected: (value) =>
                          setState(() => selectedSex = value),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
