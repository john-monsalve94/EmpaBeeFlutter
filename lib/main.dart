import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:empabee/constants/constants.dart';
import 'package:empabee/views/twoViews.dart';
import 'package:empabee/views/entradaSena.dart';
import 'package:empabee/views/signin.dart';
import 'package:empabee/views/signup.dart';
import 'package:empabee/views/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation
          .portraitUp, //esto es una configuración para que la pantalla quede
      DeviceOrientation
          .portraitDown, // siempre vertical y no se gire al horizontal
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(primaryColor: Color.fromARGB(255, 247, 167, 51)),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SIGN_IN: (BuildContext context) => SignInPage(),
        SIGN_UP: (BuildContext context) => SignUpScreen(),
        ENTRADA_SENA: (BuildContext context) => EntradaSena(),
        TWOVIEWS:(BuildContext context) => TwoViews(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}
