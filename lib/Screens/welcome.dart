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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(child: buildSwiper()));
  }

  Widget buildSwiper() {
    return Swiper(
        itemBuilder: buildSwipeItem,
        itemCount: 3,
        pagination: new SwiperPagination(
            builder: SwiperPagination.dots, alignment: Alignment.topCenter));
  }

  Widget buildSwipeItem(BuildContext context, int index) {
    String contentText = "";
    String contentImage = "";
    switch (index) {
      case 0:
        contentText =
            "Si nos cuentas cómo te sientes y el lugar en donde te encuentras, pronto podremos informarte sobre el estado del virus en tu localidad.";
        contentImage = Images.WELCOME_SECOND;
        break;
      case 1:
        contentText =
            "¡Ayúdanos a evitar que se propague el virus! Sigue las recomendaciones médicas y oficiales, quédate en casa.";
        contentImage = Images.WELCOME_FIRST;
        break;
      case 2:
        contentText =
            "¿Nada que hacer en cuarentena? Recibe algunos consejos para pasarla fenomenal en casa. ";
        contentImage = Images.WELCOME_SECOND;
        break;
    }
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SvgPicture.asset(
              contentImage,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            Text(
              contentText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark, fontSize: 16),
            ),
            InkWell(
              child: Text(
                "Saltar",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            )
          ]),
    );
  }
}
