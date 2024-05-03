import 'package:expense_app_wscube/presentation/pages/home/home_navbar.dart';
import 'package:expense_app_wscube/presentation/pages/home/home_page.dart';
import 'package:expense_app_wscube/presentation/home_page.dart';
import 'package:expense_app_wscube/presentation/pages/onborad/forgot_password.dart';
import 'package:expense_app_wscube/presentation/pages/onborad/signin.dart';
import 'package:expense_app_wscube/presentation/pages/onborad/signup.dart';
import 'package:expense_app_wscube/presentation/pages/onborad/splash.dart';
import 'package:expense_app_wscube/presentation/pages/onborad/verification.dart';
import 'package:expense_app_wscube/presentation/pages/onborad/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String SPLASH_PAGE = '/';
  static const String SIGNIN_PAGE = '/signIn';
  static const String SIGNUP_PAGE = '/signup';
  static const String WELCOME_PAGE = '/welcome';
  static const String VERIFICATION_PAGE = '/verificationCode';
  static const String PASSWORDRECOVERY_PAGE = '/passwordRecovery';
  static const String HOME_PAGE = '/home';
  static const String HOME_BNB_PAGE = '/homeBNB';


  static Map<String, Widget Function(BuildContext)> routesMap() =>
      {
        AppRoutes.SPLASH_PAGE: (context) => const SplashPage(),
        AppRoutes.SIGNIN_PAGE: (context) => const SignInPage(),
        AppRoutes.SIGNUP_PAGE: (context) => const SignUpPage(),
        AppRoutes.WELCOME_PAGE: (context) =>  const WelcomePage(),
        AppRoutes.VERIFICATION_PAGE: (context) =>  const VerificationCode(),
        AppRoutes.PASSWORDRECOVERY_PAGE: (context) =>  const ForgotPassword(),
        AppRoutes.HOME_PAGE: (context) =>  HomePage(),
        AppRoutes.HOME_BNB_PAGE: (context) =>  const HomeBNB(),

      };
}