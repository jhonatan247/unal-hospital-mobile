import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:me_cuido/Assets/images.dart';
import 'package:me_cuido/Bloc/user.dart';
import 'package:me_cuido/Repository/auth.dart';
import 'package:me_cuido/Screens/home.dart';
import 'package:me_cuido/Widgets/generic_raised_button.dart';

class RootScreen extends StatefulWidget {
  static String routeName = "root";
  @override
  State createState() {
    return _RootState();
  }
}

class _RootState extends State<RootScreen> {
  UserBloc userBloc;
  AuthRespository authRespository = AuthRespository();

  @override
  Widget build(BuildContext contexct) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return HomeScreen();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              Images.APP_LOGO,
              height: 22,
            )
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Crea una cuenta o inicia sesión",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GenericRaisedButton(
              "Iniciar sesión con Google",
              () {
                userBloc.signIn().then((FirebaseUser user) {
                  print("El usuario es ${user.displayName}");
                }).catchError((onError) => {});
              },
              solid: true,
            )
          ],
        ),
      ),
    );
  }
}
