import 'package:cryptotracker/customs/StandartButton.dart';
import 'package:cryptotracker/customs/StandartInput.dart';
import 'package:cryptotracker/customs/StandartScaffold.dart';
import 'package:cryptotracker/screens/MainMenu.dart';
import 'package:cryptotracker/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StandartScaffold(
        child: Column(children: [
          ulucanLogo(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4)
                        // changes position of shadow
                        ),
                  ],
                  color: Color(0xFF35858B),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                SizedBox(
                  height: 55,
                ),
                StandartInput(
                  icon: null,
                  texthint: "Email",
                ),
                SizedBox(
                  height: 40,
                ),
                StandartInput(
                  icon: null,
                  texthint: "Şifre",
                ),
                SizedBox(
                  height: 22.5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Şifremi Unuttum",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 22.5,
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          StandartButton(
            text: "Giriş",
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => Get.to(Register()),
            child: Text(
              "Kayıt Ol",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          Spacer(
            flex: 3,
          )
        ]),
      ),
    );
  }
}
