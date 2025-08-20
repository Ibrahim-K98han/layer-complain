import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/add_complains/add_complains_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/component/otp_success.dart';
import 'package:layer_complain/presentation/screen/authentication/component/success_password.dart';
import 'package:layer_complain/presentation/screen/authentication/create_new_password_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/login_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/register_screen.dart';
import 'package:layer_complain/presentation/screen/authentication/verify_identity_screen.dart';
import 'package:layer_complain/presentation/screen/become_a_lawyer/become_a_lawyer_screen.dart';
import 'package:layer_complain/presentation/screen/complains/complains_screen.dart';
import 'package:layer_complain/presentation/screen/find_lawyer/find_lawyer_screen.dart';
import 'package:layer_complain/presentation/screen/home/home_screen.dart';
import 'package:layer_complain/presentation/screen/lawyer_details/lawyer_details_screen.dart';
import 'package:layer_complain/presentation/screen/main_screen/main_screen.dart';
import 'package:layer_complain/presentation/screen/message/message_screen.dart';
import 'package:layer_complain/presentation/screen/profile/my_complaints_screen.dart';
import 'package:layer_complain/presentation/screen/profile/privacy_policy_screen.dart';
import 'package:layer_complain/presentation/screen/profile/profile_screen.dart';
import 'package:layer_complain/presentation/screen/profile/review_screen.dart';

import '../presentation/screen/authentication/forgot_password_screen.dart';
import '../presentation/screen/authentication/otp_screen.dart';
import '../presentation/screen/authentication/phone_number_or_email_verify_screen.dart';
import '../presentation/screen/comlaints_details/complaints_details_screen.dart';
import '../presentation/screen/find_lawyer/all_lawyer_screen.dart';
import '../presentation/screen/message/chat_screen.dart';
import '../presentation/screen/on_boarding/on_boarding_screen.dart';
import '../presentation/screen/profile/app_info_screen.dart';
import '../presentation/screen/profile/question_screen.dart';
import '../presentation/screen/profile/support_ticket_screen.dart';
import '../presentation/screen/profile/terms_condition_screen.dart';
import '../presentation/screen/settings/change_password_screen.dart';
import '../presentation/screen/settings/delete_account_screen.dart';
import '../presentation/screen/settings/language_screen.dart';
import '../presentation/screen/settings/link_account_screen.dart';
import '../presentation/screen/settings/notification_setting_screen.dart';
import '../presentation/screen/settings/profile_settings_screen.dart';
import '../presentation/screen/settings/settings_screen.dart';
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
  static const String complaintsDetailsScreen = '/complaintsDetailsScreen';
  static const String subscriptionScreen = '/subscriptionScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String findLawyerScreen = '/findLawyerScreen';
  static const String allLawyerScreen = '/allLawyerScreen';
  static const String lawyerDetailsScreen = '/lawyerDetailsScreen';
  static const String myComplaintsScreen = '/myComplaintsScreen';
  static const String reviewScreenScreen = '/reviewScreenScreen';
  static const String chatScreen = '/chatScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsConditionScreen = '/termsConditionScreen';
  static const String supportTicketScreen = '/supportTicketScreen';
  static const String questionScreen = '/questionScreen';
  static const String appInfoScreen = '/appInfoScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String profileSettingsScreen = '/profileSettingsScreen';
  static const String notificationSettingScreen = '/notificationSettingScreen';
  static const String languageScreen = '/languageScreen';
  static const String linkAccountScreen = '/linkAccountScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String deleteAccountScreen = '/deleteAccountScreen';
  static const String becomeALawyerScreen = '/becomeALawyerScreen';

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
      case RouteNames.complaintsDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ComplaintsDetailsScreen(),
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
      case RouteNames.findLawyerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FindLawyerScreen(),
        );
      case RouteNames.allLawyerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AllLawyerScreen(),
        );
      case RouteNames.lawyerDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LawyerDetailsScreen(),
        );
      case RouteNames.myComplaintsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyComplaintsScreen(),
        );
      case RouteNames.reviewScreenScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReviewScreen(),
        );
      case RouteNames.chatScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChatScreen(),
        );
      case RouteNames.privacyPolicyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PrivacyPolicyScreen(),
        );
      case RouteNames.termsConditionScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TermsConditionScreen(),
        );
      case RouteNames.supportTicketScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SupportTicketScreen(),
        );
      case RouteNames.questionScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const QuestionScreen(),
        );
      case RouteNames.appInfoScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AppInfoScreen(),
        );
      case RouteNames.settingsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case RouteNames.profileSettingsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfileSettingsScreen(),
        );
      case RouteNames.notificationSettingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotificationSettingScreen(),
        );
      case RouteNames.languageScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LanguageScreen(),
        );
      case RouteNames.linkAccountScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LinkAccountScreen(),
        );
      case RouteNames.changePasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChangePasswordScreen(),
        );
      case RouteNames.deleteAccountScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DeleteAccountScreen(),
        );
      case RouteNames.becomeALawyerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BecomeALawyerScreen(),
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
