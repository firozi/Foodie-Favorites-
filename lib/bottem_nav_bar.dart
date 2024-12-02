import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delicious_food/Screens/home_screen.dart';
import 'package:delicious_food/Screens/order_screen.dart';
import 'package:delicious_food/Screens/profile_screen.dart';
import 'package:delicious_food/Screens/wallet_screen.dart';
import 'package:flutter/material.dart';

class BottemNavBar extends StatefulWidget {
  const BottemNavBar({Key? key}) : super(key: key);

  @override
  _BottemNavBarState createState() => _BottemNavBarState();
}

class _BottemNavBarState extends State<BottemNavBar> {
  late List<Widget> Screens;
  int currentScreen = 0;

  @override
  void initState() {
    Screens = [HomeScreen(), OrderScreen(), WalletScreen(), ProfileScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index){
          currentScreen=index;
          setState(() {});
          },
          items: [
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.wallet_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
      ]
      ),
      body:Screens[currentScreen],
    );
  }
}
