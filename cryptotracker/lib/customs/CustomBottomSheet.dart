import 'package:cryptotracker/customs/StandartButton.dart';
import 'package:cryptotracker/customs/StandartInput.dart';
import 'package:cryptotracker/models/coinGeckoModel.dart';
import 'package:flutter/material.dart';

List<Coin> favoriteDataList = [];
List<Coin> walletSave = [];
List<double> valuevalue = [];
List<double> amountvaluex = [];

class CustomDraggableScrollableSheet extends StatefulWidget {
  final Coin coin;
  bool iconChanger;

  CustomDraggableScrollableSheet({
    required this.coin,
    this.iconChanger = true,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDraggableScrollableSheet> createState() =>
      _CustomDraggableScrollableSheetState();
}

class _CustomDraggableScrollableSheetState
    extends State<CustomDraggableScrollableSheet> {
  final currentValuex = TextEditingController();
  final amountValue = TextEditingController();

  var selectValue;

  bool isVisible = false;
  var noTap = Icons.favorite_border_outlined;
  var ontap = Icons.favorite;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        snap: true,
        expand: false,
        initialChildSize: 0.85,
        builder: (context, ScrollController scrollController) =>
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey,
                    ),
                    width: 30,
                    height: 4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Spacer(flex: 3),
                      Expanded(
                        flex: 14,
                        child: Text(
                          widget.coin.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                          flex: 1,
                          child: widget.iconChanger == true
                              ? InkWell(
                                  child: Icon(noTap, color: Colors.white),
                                  onTap: () {
                                    setState(() {
                                      noTap = Icons.favorite;
                                      favoriteDataList.add(widget.coin);
                                    });
                                  },
                                )
                              : InkWell(
                                  child: Icon(ontap, color: Colors.white),
                                  onTap: () {
                                    setState(() {
                                      ontap = Icons.favorite_border_outlined;
                                      favoriteDataList.remove(widget.coin);
                                    });
                                  },
                                )),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 60,
                      child: Image.network(widget.coin.imageUrl)),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Varlıklarınız Ekleyin",
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer()
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 18,
                              child: Visibility(
                                visible: isVisible,
                                child: Container(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "${widget.coin.price}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                                replacement: StandartInput(
                                  texthint: "Aldığınız Değer",
                                  controller: currentValuex,
                                  margin: 0,
                                  icon: null,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 7,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isVisible == false
                                        ? isVisible = true
                                        : isVisible = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 4)
                                            // changes position of shadow
                                            ),
                                      ],
                                      color: Color(0xFF35858B),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 7),
                                    child: Text(
                                      isVisible == false
                                          ? "Güncel veri"
                                          : "Değer Girin",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 18,
                              child: StandartInput(
                                texthint: "Miktar Giriniz",
                                controller: amountValue,
                                margin: 0,
                                icon: null,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: StandartButton(
                                text: "Ekle",
                                callback: () {
                                  (valuevalue.add(double.parse(
                                          amountValue.text) *
                                      (isVisible == true
                                          ? widget.coin.price.toDouble()
                                          : double.parse(currentValuex.text))));
                                  walletSave.add(widget.coin);
                                  amountvaluex
                                      .add(double.parse(amountValue.text));

                                  print(valuevalue);
                                }))
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
