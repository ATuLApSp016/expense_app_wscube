import 'package:expense_app_wscube/domain/routes/app_routes.dart';
import 'package:expense_app_wscube/domain/utils/app_colors.dart';
import 'package:expense_app_wscube/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsConstant.primary_Color),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.SPLASH_PAGE,
      routes: AppRoutes.routesMap(),
    /*  home: HomePage(),*/
    );
  }
}
