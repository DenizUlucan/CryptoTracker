import 'package:cryptotracker/customs/StandartScaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

//todo gölge ekle main menu butonlarına

class _MainMenuState extends State<MainMenu> {
  final List<Map> selectApi = [
    {"image": "assets/images/coin.png", "text": "Kripto Paralar"},
    {"image": "assets/images/stockMarket.png", "text": "Hisse Senedi"},
    {"image": "assets/images/dollar.png", "text": "Döviz"},
    {"image": "assets/images/gold.png", "text": "Altın / Gümüş"},
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: SafeArea(
            child: StandartScaffold(
      child: Column(children: [
        ulucanLogo(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: GridView.count(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 25,
            children: selectApi.map((Map selectApi) {
              return menuGridCell(selectApi["image"], selectApi["text"]);
            }).toList(),
          ),
        )
      ]),
    )));
  }

  Widget menuGridCell(image, text) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFF35858B), borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Image.asset(image),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18),
            )
          ],
        ));
  }
}

Widget ulucanLogo() {
  return Column(
    children: [
      SizedBox(
        height: 42,
      ),
      Text(
        "Ulucan",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
      SizedBox(
        height: 42,
      ),
    ],
  );
}
