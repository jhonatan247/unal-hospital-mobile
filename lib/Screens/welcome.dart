import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Screens/home.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "welcome";
  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> itemContentTextList = [
    "Si nos cuentas cómo te sientes y el lugar en donde te encuentras, pronto podremos informarte sobre el estado del virus en tu localidad.",
    "¡Ayúdanos a evitar que se propague el virus! Sigue las recomendaciones médicas y oficiales, quédate en casa.",
    "¿Nada que hacer en cuarentena? Recibe algunos consejos para pasarla fenomenal en casa."
  ];
  final List<String> itemContentImageList = [
    Images.WELCOME_FIRST,
    Images.WELCOME_SECOND,
    Images.WELCOME_FIRST
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(child: buildSwiper()),
      bottomNavigationBar: Container(
        color: Theme.of(context).backgroundColor,
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        child: InkWell(
          child: Text(
            "Saltar",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
        ),
      ),
    );
  }

  Widget buildSwiper() {
    return Swiper(
        itemBuilder: buildSwipeItem,
        loop: false,
        itemCount: 3,
        onIndexChanged: (int index) {
          print("tap");
          print(index);
        },
        pagination: new SwiperPagination(
            builder: SwiperPagination.dots, alignment: Alignment.bottomCenter));
  }

  Widget buildSwipeItem(BuildContext context, int index) {
    String contentText = itemContentTextList[index];
    String contentImage = itemContentImageList[index];
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              contentImage,
              fit: BoxFit.fill,
            ),
            Text(
              contentText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark, fontSize: 16),
            ),
          ]),
    );
  }
}
