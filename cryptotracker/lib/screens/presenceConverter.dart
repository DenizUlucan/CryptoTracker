import 'package:cryptotracker/customs/StandartButton.dart';
import 'package:cryptotracker/customs/StandartDropddown.dart';
import 'package:cryptotracker/customs/StandartInput.dart';
import 'package:cryptotracker/customs/StandartScaffold.dart';
import 'package:cryptotracker/screens/MainMenu.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  Converter({Key? key}) : super(key: key);

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String dropdownValue = 'One';
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
                  "Varlık Dönüştürücü",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Row(
              children: [
                Expanded(
                    flex: 20,
                    child: StandartInput(
                      icon: null,
                      texthint: "Miktar Giriniz",
                    )),
                Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: StandartDropdown(),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Spacer(
                    flex: 10,
                  ),
                  Expanded(flex: 10, child: StandartDropdown()),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            StandartButton(
              text: "Dönüştür",
            )
          ],
        ),
      )),
    );
  }
}
