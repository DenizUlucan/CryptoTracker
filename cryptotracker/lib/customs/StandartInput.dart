import 'package:flutter/material.dart';

class StandartInput extends StatelessWidget {
  final String texthint;
  final double margin;
  final IconData? icon;
  final TextEditingController? controller;

  const StandartInput({
    this.controller,
    Key? key,
    this.icon = Icons.search,
    this.margin = 30,
    this.texthint = "Ara",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: TextField(
        maxLines: 1,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 16.0, color: Colors.white),
        decoration: InputDecoration(
            isCollapsed: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: texthint,
            fillColor: Colors.white.withOpacity(0.12),
            filled: true,
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(icon),
            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
      ),
    );
  }
}
