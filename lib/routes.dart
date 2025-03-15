import 'package:flutter/widgets.dart';
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
import 'screens/swap/swap_screen.dart';
import 'screens/sell/sell_screen.dart';
import 'screens/child_lock/child_lock_screen.dart';
import 'screens/settings/settings_screen.dart'; // Add this import
import 'screens/help_center/help_center_screen.dart'; // Add this import
import 'screens/flash_deal/flash_deal_screen.dart';
import 'screens/Game_deal/game_deal_screen.dart';
import 'screens/daily_gift_deal/daily_gift_screen.dart';

final Map<String, WidgetBuilder> routes = {
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
  SwapScreen.routeName: (context) => SwapScreen(),
  SellScreen.routeName: (context) => const SellScreen(),
  ChildLockScreen.routeName: (context) => const ChildLockScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(), // Add this route
  HelpCenterScreen.routeName: (context) => const HelpCenterScreen(), // Add this route
  FlashDealScreen.routeName: (context) =>  FlashDealScreen(),
  GameDealScreen.routeName:(context) => GameDealScreen(),
  DailyGiftScreen.routeName:(context) => DailyGiftScreen(),
};
