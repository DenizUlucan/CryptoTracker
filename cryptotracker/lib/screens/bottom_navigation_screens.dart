import 'package:cryptotracker/customs/bottom_navy_bar.dart';
import 'package:cryptotracker/screens/MainMenu.dart';
import 'package:cryptotracker/screens/myFavorites.dart';
import 'package:cryptotracker/screens/mydatas.dart';
import 'package:cryptotracker/screens/presenceConverter.dart';
import 'package:cryptotracker/screens/wallet.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  List<Widget> _listPages = [
    listApiDatas(),
    Favorites(),
    MyWallet(),
    Converter(),
    MainMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: _listPages[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavyBar(
            backgroundColor: Color(0xFF35858B),
            selectedIndex: currentIndex,
            showElevation: true,
            itemCornerRadius: 12,
            curve: Curves.easeInQuad,
            onItemSelected: (index) => setState(() {
              currentIndex = index;
            }),
            items: [
              BottomNavyBarItem(
                icon: Image.asset(
                  "assets/icons/home.png",
                ),
                title: Text('Varlıklar'),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Image.asset("assets/icons/favorites.png"),
                title: Text(
                  'Favorilerim',
                ),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Image.asset("assets/icons/wallet.png"),
                title: Text('Cüzdanım'),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Image.asset("assets/icons/converter.png"),
                title: Text('Dönüştürücü'),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Image.asset("assets/icons/widget.png"),
                title: Text('?'),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
