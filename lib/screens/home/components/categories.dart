import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/flash_deal/flash_deal_screen.dart';
import 'package:shop_app/screens/Game_deal/game_deal_screen.dart';
import 'package:shop_app/screens/daily_gift_deal/daily_gift_screen.dart';
// Use the same import strategy here as in routes.dart
import 'package:shop_app/screens/swap/swap.dart' as swap_model;
import 'package:shop_app/screens/swap/swap_screen.dart';
import 'package:shop_app/screens/sell/sell_screen.dart';
import 'package:shop_app/screens/child_lock/child_lock_screen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},     
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Settings.svg", "text": "Feed"},
      {"icon": "assets/icons/Bell.svg", "text": "Activity"},
      {"icon": "assets/icons/Lock.svg", "text": "Lock"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              if (categories[index]["text"] == "Flash Deal") {
                Navigator.pushNamed(context, FlashDealScreen.routeName);
              } else if (categories[index]["text"] == "Game") {
                Navigator.pushNamed(context, GameDealScreen.routeName);
              } else if (categories[index]["text"] == "Daily Gift") {
                Navigator.pushNamed(context, DailyGiftScreen.routeName);
              } else if (categories[index]["text"] == "Feed") {
                Navigator.pushNamed(context, SwapScreen.routeName);
              } else if (categories[index]["text"] == "Activity") {
                Navigator.pushNamed(context, SellScreen.routeName);
              } else if (categories[index]["text"] == "Lock") {
                Navigator.pushNamed(context, ChildLockScreen.routeName);
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}