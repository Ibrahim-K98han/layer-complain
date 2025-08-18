import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/add_complains/add_complains_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/component/otp_success.dart';
import 'package:layer_complain/presentation/screen/authentication/component/success_password.dart';
import 'package:layer_complain/presentation/screen/authentication/create_new_password_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/login_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/register_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/verify_identity_screen.dart';
import 'package:layer_complain/presentation/screen/complains/complains_screen.dart';
import 'package:layer_complain/presentation/screen/details/details_screen.dart';
import 'package:layer_complain/presentation/screen/home/home_screen.dart';
import 'package:layer_complain/presentation/screen/main_screen/main_screen.dart';
import 'package:layer_complain/presentation/screen/message/message_screen.dart';
import 'package:layer_complain/presentation/screen/profile/profile_screen.dart';

import '../presentation/screen/authentication/forgot_password_screen.dart';
import '../presentation/screen/authentication/otp_screen.dart';
import '../presentation/screen/authentication/phone_number_or_email_verify_screen.dart';
import '../presentation/screen/on_boarding/on_boarding_screen.dart';
import '../presentation/screen/splash/splash_screen.dart';
import '../presentation/screen/subscription/payment_screen.dart';
import '../presentation/screen/subscription/sub_scription_screen.dart';

class RouteNames {
  static const String splashScreen = '/splashScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String verifyIdentityScreen = '/verifyIdentityScreen';
  static const String phoneNumberVerifyScreen = '/phoneNumberVerifyScreen';
  static const String otpScreen = '/otpScreen';
  static const String otpSuccess = '/otpSuccess';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String createNewPasswordScreen = '/createNewPasswordScreen';
  static const String successPasswordScreen = '/successPasswordScreen';
  static const String mainScreen = '/mainScreen';
  static const String homeScreen = '/homeScreen';
  static const String complainScreen = '/complainScreen';
  static const String messageScreen = '/messageScreen';
  static const String profileScreen = '/profileScreen';
  static const String addComplainsScreen = '/addComplainsScreen';
  static const String detailsScreen = '/detailsScreen';
  static const String subscriptionScreen = '/subscriptionScreen';
  static const String paymentScreen = '/paymentScreen';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnBoardingScreen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case RouteNames.registerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterScreen(),
        );
      case RouteNames.verifyIdentityScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const VerifyIdentityScreen(),
        );
      case RouteNames.phoneNumberVerifyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PhoneNumberOrEmailVerifyScreen(),
        );
      case RouteNames.otpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OtpScreen(),
        );
      case RouteNames.otpSuccess:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OtpSuccess(),
        );
      case RouteNames.forgotPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgotPasswordScreen(),
        );
      case RouteNames.createNewPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CreateNewPasswordScreen(),
        );
      case RouteNames.successPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SuccessPassword(),
        );
      case RouteNames.mainScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case RouteNames.complainScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ComplainsScreen(),
        );
      case RouteNames.messageScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MessageScreen(),
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );
      case RouteNames.addComplainsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddComplainsScreen(),
        );
      case RouteNames.detailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DetailsScreen(),
        );
      case RouteNames.subscriptionScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SubScriptionScreen(),
        );
      case RouteNames.paymentScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PaymentScreen(),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('No Route Found ${settings.name}')),
              ),
        );
    }
  }
}
