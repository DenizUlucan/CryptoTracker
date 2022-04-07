import 'package:cryptotracker/customs/CustomBottomSheet.dart';
import 'package:cryptotracker/models/coinGeckoModel.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  String name;
  double abodenemeusta;
  double price;
  double amountvaluex;
  WalletCard(
      {required this.name,
      required this.abodenemeusta,
      required this.price,
      required this.amountvaluex,
      Key? key})
      : super(key: key);

  double? dif = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${abodenemeusta.toStringAsFixed(3)}",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                      abodenemeusta - amountvaluex * price < 0
                          ? '+' +
                              "${dif = (abodenemeusta - amountvaluex * price)}"
                          : '-' +
                              "${dif = abodenemeusta - amountvaluex * price}",
                      style: TextStyle(
                        color: dif! > 0 ? Colors.red : Colors.green,
                      )),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.remove),
              ),
            )
          ],
        ),
        Divider(
          height: 12,
          color: Colors.grey,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
