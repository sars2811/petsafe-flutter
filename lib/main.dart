import 'package:flutter/material.dart';
import 'package:pawsafe/screens/adds.dart';
import 'package:pawsafe/screens/feed.dart';
import 'package:pawsafe/screens/welcome_screen.dart';
import 'package:pawsafe/screens/login_screen.dart';
import 'package:pawsafe/screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pawsafe/screens/addp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Pawsafe());
}

class Pawsafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        FeedScreen.id: (context) => FeedScreen(),
        '/addPet' : (BuildContext context) => AddP(),
        '/addStray' : (BuildContext context) => AddS()
      },
    );
  }
}
