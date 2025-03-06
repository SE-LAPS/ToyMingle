import 'package:flutter/material.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import '../../swap/swap_screen.dart';
import '../../sell/sell_screen.dart';
import '../../child_lock/child_lock_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  void _showDropdownMenu(BuildContext context, RenderBox button) {
    final buttonPosition = button.localToGlobal(Offset.zero);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + button.size.height,
        buttonPosition.dx + button.size.width,
        buttonPosition.dy + button.size.height + 200,
      ),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      items: [
        PopupMenuItem<String>(
          value: 'swap',
          child: Row(
            children: [
              const Icon(Icons.swap_horiz, color: Color(0xFFFF7643)),
              const SizedBox(width: 8),
              Text(
                'Add to Swap',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'sell',
          child: Row(
            children: [
              const Icon(Icons.sell, color: Color(0xFFFF7643)),
              const SizedBox(width: 8),
              Text(
                'Add to Sell',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'childLock',
          child: Row(
            children: [
              const Icon(Icons.lock, color: Color(0xFFFF7643)),
              const SizedBox(width: 8),
              Text(
                'Child Lock',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    ).then((String? value) {
      if (value != null) {
        switch (value) {
          case 'swap':
            Navigator.pushNamed(context, SwapScreen.routeName);
            break;
          case 'sell':
            Navigator.pushNamed(context, SellScreen.routeName);
            break;
          case 'childLock':
            Navigator.pushNamed(context, ChildLockScreen.routeName);
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          Builder(
            builder: (context) => IconBtnWithCounter(
              svgSrc: "assets/icons/Plus Icon.svg",
              press: () {
                final RenderBox button =
                    context.findRenderObject() as RenderBox;
                _showDropdownMenu(context, button);
              },
            ),
          ),
          const SizedBox(width: 8),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
