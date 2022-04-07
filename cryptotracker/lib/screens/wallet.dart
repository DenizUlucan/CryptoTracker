import 'package:cryptotracker/customs/CustomBottomSheet.dart';
import 'package:cryptotracker/customs/StandartScaffold.dart';
import 'package:cryptotracker/customs/custom_wallet_card.dart';
import 'package:cryptotracker/screens/MainMenu.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatefulWidget {
  MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  Color expansionTileColor = Color(0xFF35858B);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StandartScaffold(
          child: Column(
        children: [
          ulucanLogo(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                "Cüzdanım",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Placeholder(
            fallbackHeight: 200,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: expansionTileColor,
              child: ExpansionTile(
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      expansionTileColor = Color(0xFF4FBDBA);
                    } else {
                      expansionTileColor = Color(0xFF35858B);
                    }
                  });
                },
                textColor: Colors.black,
                iconColor: Colors.black,
                collapsedIconColor: Colors.black,
                title: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/images/coin.png"),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Kripto Paralar",
                    )
                  ],
                ),
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        walletSave.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'Henüz bir coin eklemediniz.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: walletSave.length,
                                itemBuilder: (context, index) {
                                  return WalletCard(
                                    name: walletSave[index].name,
                                    abodenemeusta: valuevalue[index].toDouble(),
                                    price: walletSave[index].price.toDouble(),
                                    amountvaluex: amountvaluex[index],
                                  );
                                })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
