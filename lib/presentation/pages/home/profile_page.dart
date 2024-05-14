import 'package:expense_app_wscube/data/repository/local/database_helper.dart';
import 'package:expense_app_wscube/domain/routes/app_routes.dart';
import 'package:expense_app_wscube/domain/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedBTN(
            cText: 'Sign Up',
            onTap: () async {
              var pref = await SharedPreferences.getInstance();
              pref.setInt(AppDatabase.PRIMARY_KEY, 0);
              Navigator.pushReplacementNamed(context, AppRoutes.SIGNIN_PAGE);
            },
          )),
    );
  }
}
