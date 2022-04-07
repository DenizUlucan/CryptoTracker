import 'dart:async';
import 'dart:convert';
import 'package:cryptotracker/screens/myFavorites.dart';
import 'package:cryptotracker/services/coinService.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:cryptotracker/customs/Custom_card.dart';
import 'package:cryptotracker/customs/StandartScaffold.dart';
import 'package:cryptotracker/models/coinGeckoModel.dart';
import 'package:cryptotracker/screens/MainMenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class listApiDatas extends StatefulWidget {
  listApiDatas({Key? key}) : super(key: key);

  @override
  State<listApiDatas> createState() => _listApiDatasState();
}

class _listApiDatasState extends State<listApiDatas> {
  Future<List<Coin>>? _listeDeneme;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) => CoinService.fetchCoin());
    setState(() {
      _listeDeneme = CoinService.fetchCoin();
      coinList;
      coinListForDisplay = coinList;
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StandartScaffold(
        child: Column(
          children: [
            ulucanLogo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  const Text(
                    "Kripto Paralar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Spacer()
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Ara",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10.0),
                    suffixIcon: Icon(Icons.search),
                  ),
                  controller: controller,
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      coinListForDisplay = coinList.where((coinelement) {
                        var coinTitle = coinelement.name.toLowerCase();
                        return coinTitle.contains(text);
                      }).toList();
                    });
                  },
                  autofocus: false,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                )),
            SizedBox(
              height: 32,
            ),
            FutureBuilder<List<Coin>>(
              future: _listeDeneme,
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      CircularProgressIndicator(),
                    ],
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    return Center(
                      child: Text('Bir hata oluştu of ya'),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: coinListForDisplay.length + 1,
                          itemBuilder: (context, index) {
                            return index == coinListForDisplay.length
                                ? SizedBox(
                                    height: 40,
                                  )
                                : InkWell(
                                    onTap: (() {
                                      customBottomSheet(context, index);
                                    }),
                                    child: ListViewCard(
                                      name: coinListForDisplay[index].name,
                                      symbol: coinListForDisplay[index].symbol,
                                      imageUrl:
                                          coinListForDisplay[index].imageUrl,
                                      price: coinListForDisplay[index]
                                          .price
                                          .toDouble(),
                                      change: coinListForDisplay[index]
                                          .change
                                          .toDouble(),
                                      changePercentage:
                                          coinListForDisplay[index]
                                              .changePercentage
                                              .toDouble(),
                                    ),
                                  );
                          }),
                    );
                  }
                }
              },
            ),

            /* ListViewCard(
                name: "Bitcoin",
                symbol: "btc",
                imageUrl:
                    "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                price: 40353,
                change: -41.53232,
                changePercentage: -0.99126) */
          ],
        ),
      ),
    );
  }
}
