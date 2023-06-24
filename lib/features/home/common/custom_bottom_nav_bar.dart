import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


import '../views/history/history_screen.dart';
import '../views/home/home_screen.dart';
import '../views/payment/payment_screen.dart';
import '../views/profile/profile_screen.dart';
import '../views/qr_code/qr_code_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    final Key? key,
  }) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final PersistentTabController _controller = PersistentTabController();

  List<Widget> _buildScreens() => [
        const HomeScreen(),
        const PaymentScreen(),
         const QrCodeScreen(),
        const HistoryScreen(),
        const ProfileScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.roofing_outlined),
            
            title: "Главная",
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.local_offer_outlined),
            title: "Платежи",
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
            activeColorPrimary: Colors.white,
            contentPadding: 10,
            icon: Container(
              height: 45,
              width: 40,
              decoration: BoxDecoration(
                  boxShadow: const [
                  BoxShadow(
                      color: Colors.blue,
                      blurRadius: 10,
                      offset: Offset(0, 0)),
                ],
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.qr_code_scanner_rounded,
              ),
            ),
            ),
        PersistentBottomNavBarItem(
            icon:  Icon(Icons.schedule_outlined),
            title: "История",
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.bubble_chart_outlined),
            title: "Ещё",
            
            inactiveColorPrimary: Colors.grey),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          navBarHeight: 55,
          backgroundColor: Colors.white,
          navBarStyle:
              NavBarStyle.style6,

        ),
      );
}
