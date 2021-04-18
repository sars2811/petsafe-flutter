import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:pawsafe/screens/drawer.dart';

class FeedScreen extends StatefulWidget {
  static const String id = 'feed_screen';
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: null,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
        title: Text(
          'Home Page',
          style: GoogleFonts.baskervville(
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      drawer: Scaffold(
        backgroundColor: Colors.transparent,
        body: MainDrawer(),
      ),
    );
  }
}
