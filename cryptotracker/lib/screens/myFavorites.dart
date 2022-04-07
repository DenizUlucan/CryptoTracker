import 'package:cryptotracker/customs/CustomBottomSheet.dart';
import 'package:cryptotracker/customs/Custom_card.dart';
import 'package:cryptotracker/customs/StandartScaffold.dart';
import 'package:cryptotracker/models/coinGeckoModel.dart';
import 'package:cryptotracker/screens/MainMenu.dart';
import 'package:cryptotracker/screens/mydatas.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: StandartScaffold(
              child: Column(
        children: [
          ulucanLogo(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                "Favorilerim",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          favoriteDataList.isEmpty
              ? const Center(
                  child: Text(
                    'Henüz bir favori eklemediniz.',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: favoriteDataList.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: (() {
                        customBottomSheetFavorites(context, index);
                      }),
                      child: ListViewCard(
                          name: favoriteDataList[index].name,
                          symbol: favoriteDataList[index].symbol,
                          imageUrl: favoriteDataList[index].imageUrl,
                          price: favoriteDataList[index].price.toDouble(),
                          change: favoriteDataList[index].change.toDouble(),
                          changePercentage: favoriteDataList[index]
                              .changePercentage
                              .toDouble()),
                    );
                  }))

          /* InkWell(
            onTap: () => null,
            child: ListViewCard(
                name: "Bitcoin",
                symbol: "btc",
                imageUrl:
                    "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                price: 40353,
                change: -41.53232,
                changePercentage: -0.99126),
          ), */
        ],
      ))),
    );
  }
}

customBottomSheet(BuildContext context, index) {
  return showModalBottomSheet(
      backgroundColor: Color(0xFF1E2630),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => CustomDraggableScrollableSheet(
            coin: coinListForDisplay[index],
            iconChanger: true,
          ));
}

customBottomSheetFavorites(BuildContext context, index) {
  return showModalBottomSheet(
      backgroundColor: Color(0xFF1E2630),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => CustomDraggableScrollableSheet(
            coin: favoriteDataList[index],
            iconChanger: false,
          ));
}
