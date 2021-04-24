import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/map_screen.dart';
import 'package:flash_chat/screens/offers_screen.dart';
import 'package:flash_chat/screens/profile_screen.dart';
import 'package:flash_chat/screens/qrcode_screen.dart';
import 'package:flash_chat/screens/settings_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final List<Widget> _children = [
    MapScreen(),
    OffersScreen(),
    QrcodeScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];
  @override

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser();
      if( user != null){
        loggedInUser  = user;
        print(loggedInUser.email);
      }
    }
    catch (e) {
      print (e);
    }


  }
  void onTabTapped(int index) {

    setState(() {
      _currentIndex = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(0xFFc21e53),
        onTap: onTabTapped,
        elevation: 1.0,
        backgroundColor: Color(0xFF),// new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.map),
            title: Text('Localisation')
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.payment),
              title: Text('Offres'),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_overscan),
              title: Text('Qr-Code')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
              title: Text('Profil')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Parametres')
          ),
        ],
      ),
      body:_children[_currentIndex],

    );
  }
}
