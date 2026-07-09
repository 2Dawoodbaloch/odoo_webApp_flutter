import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/utils/constants/app_radius.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/features/employee/view/widgets/info_row.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.imageUrl,
    this.onTap,
  });

  final String name;
  final String role;
  final String email;
  final String phone;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias, // keeps image corners rounded with card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // image
            SizedBox(
              width: 120,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),

            // Right: content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.4,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xxs),
                        InfoRow(icon: Icons.work_outline, text: role),
                        InfoRow(icon: Icons.email_outlined, text: email),
                        InfoRow(icon: Icons.phone_outlined, text: phone),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            CustomButton(
                              title: "Consultant",
                              backgroundColor: APPColors.btnSky,
                              radius: AppRadius.lg,
                              textSize: 10,
                            ),
                            SizedBox(width: 8),
                            CustomButton(
                              title: "Demo",
                              backgroundColor: APPColors.btnMango,
                              radius: AppRadius.lg,
                              textSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                           
                          ],
                        ),
                        
                      ],
                    ),

                   
              ),
            ),
          ],
        ),
      ),
    );
  }
}
