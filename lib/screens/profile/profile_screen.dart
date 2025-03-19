import 'package:flutter/material.dart';

import '../help_center/help_center_screen.dart';
import '../settings/settings_screen.dart';
import '../splash/splash_screen.dart'; // Added import for SplashScreen
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Navigator.pushNamed(context, HelpCenterScreen.routeName);
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                // Show confirmation dialog
                showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  
  // Function to show a confirmation dialog before logging out
  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
            TextButton(
              child: const Text("Log Out"),
              onPressed: () {
                Navigator.of(context).pop(); 
                
                // Clear navigation stack and go to splash screen
                Navigator.of(context).pushNamedAndRemoveUntil(
                  SplashScreen.routeName,
                  (Route<dynamic> route) => false, 
                );
              },
            ),
          ],
        );
      },
    );
  }
}