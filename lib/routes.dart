import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/auth/email_verification_screen.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/init_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/swap/post_swap_screen.dart';
import 'screens/swap/swap_screen.dart';
import 'screens/sell/sell_screen.dart';
import 'screens/child_lock/child_lock_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/help_center/help_center_screen.dart';
import 'screens/flash_deal/flash_deal_screen.dart';
import 'screens/game_deal/game_deal_screen.dart';
import 'screens/daily_gift_deal/daily_gift_screen.dart';
import 'widgets/auth_wrapper.dart';

// Define all routes in one place
final Map<String, WidgetBuilder> routes = {
  AuthWrapper.routeName: (context) => const AuthWrapper(),
  InitScreen.routeName: (context) => const InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  SwapScreen.routeName: (context) => const SwapScreen(),
  PostSwapScreen.routeName: (context) => const PostSwapScreen(),
  SellScreen.routeName: (context) => const SellScreen(),
  ChildLockScreen.routeName: (context) => const ChildLockScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  HelpCenterScreen.routeName: (context) => const HelpCenterScreen(),
  FlashDealScreen.routeName: (context) => FlashDealScreen(),
  GameDealScreen.routeName: (context) => GameDealScreen(),
  DailyGiftScreen.routeName: (context) => const DailyGiftScreen(),
  EmailVerificationScreen.routeName: (context) => const EmailVerificationScreen(),
};