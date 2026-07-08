import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/widgets/person_card.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisExtent: 150,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return PersonCard(
            name: "Emma Granger",
            role: "Consultant",
            email: "granger@mycompany.example.com",
            phone: "(555)-768-6230",
            imageUrl: "assets/images/business.jpg",

          );
        },
      ),
    );
  }
}
