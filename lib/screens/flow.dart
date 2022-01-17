import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/screens/cloth.dart';
import 'package:nbb/screens/favorite.dart';
import 'package:nbb/screens/home.dart';
import 'package:nbb/screens/profile.dart';
import 'package:nbb/screens/shoes.dart';

class FlowScreen extends StatefulWidget {
  const FlowScreen({Key? key}) : super(key: key);
  static const String id = 'flow';

  @override
  _FlowScreenState createState() => _FlowScreenState();
}

class _FlowScreenState extends State<FlowScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  _screenOptions(int index) {
    if (index == 0) {
      return const HomeScreen();
    } else if (index == 1) {
      return const ShoeScreen();
    } else if (index == 2) {
      return const ClothScreen();
    } else if (index == 3) {
      return const FavoriteScreen();
    } else if (index == 4) {
      return const ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color(0xff111015),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(),
                flex: 5,
              ),
            ],
          ),
          _screenOptions(selectedIndex),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 90,
              child: Card(
                margin: const EdgeInsets.all(20).copyWith(top: 0),
                elevation: 5,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: blackColor,
                  selectedIconTheme: const IconThemeData(color: whiteColor),
                  unselectedIconTheme: const IconThemeData(color: greyColor),
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: selectedIndex,
                  onTap: onItemTapped,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/house.png')),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/ankle-boot.png'),
                        size: 27,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/dress.png'),
                        size: 30,
                      ),
                      label: ' =) ',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/heart.png')),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/account.png'),
                        size: 27,
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
