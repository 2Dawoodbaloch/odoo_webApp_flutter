import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/images.jpg"),
        ),
        title: Text("Muhammad Dawood"),
        subtitle: Text("create new info...."),
        trailing: Text("12:30 PM"),
      ),
    );
  }
}