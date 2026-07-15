import 'package:flutter/material.dart';
import 'package:flutter_odoo/routes/app_routes.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
    initialRoute: RoutesName.home,
      getPages: AppRouter.pages, 
    );
  }
}
