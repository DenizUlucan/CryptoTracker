import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  ListViewCard({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    Key? key,
  }) : super(key: key);

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(imageUrl)),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      symbol,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.61), fontSize: 16),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                    change.toDouble() < 0
                        ? change.toDouble().toStringAsFixed(4)
                        : '+' + change.toDouble().toStringAsFixed(4),
                    style: TextStyle(
                        color:
                            change.toDouble() < 0 ? Colors.red : Colors.green,
                        fontSize: 16)),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text(price.toDouble().toString(),
                        overflow: TextOverflow.clip,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      changePercentage.toDouble() < 0
                          ? changePercentage.toDouble().toStringAsFixed(2) + '%'
                          : '+' +
                              changePercentage.toDouble().toStringAsFixed(2) +
                              '%',
                      style: TextStyle(
                          color: changePercentage.toDouble() < 0
                              ? Colors.red
                              : Colors.green,
                          fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 25,
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          )
        ],
      ),
    );
  }
}
