import 'package:flutter/material.dart';

class StandartButton extends StatelessWidget {
  final String? text;
  Function? callback;

  StandartButton({
    this.callback,
    this.text = "Dönüştür",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback!();
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4)
              // changes position of shadow
              ),
        ], color: Color(0xFF35858B), borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
          child: Text(
            text!,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
