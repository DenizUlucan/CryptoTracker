import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class StandartScaffold extends StatelessWidget {
  final Widget child;

  const StandartScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF141e30),
                  Color(0xff243b55),
                ],
              )),
              child: child,
            ),
          )),
    );
  }
}
