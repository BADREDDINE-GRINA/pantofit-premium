
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/screens/offers_screen.dart';
import 'package:flash_chat/screens/profile_screen.dart';
import 'package:flash_chat/screens/qrcode_screen.dart';
import 'package:flash_chat/screens/settings_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/map_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) =>  RegistrationScreen(),
        MapScreen.id: (context) => MapScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        OffersScreen.id: (context) => OffersScreen(),
        SettingsScreen.id : (context) => SettingsScreen(),
        ProfileScreen.id : (context) => ProfileScreen(),
        QrcodeScreen.id : (context) => QrcodeScreen()
      },

    );
  }
}
